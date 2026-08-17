#!/bin/sh
# SE301-revision: sync + site container + public funnel route (idempotent).
# Run from the hermes container. Uses docker exec hermes (root) to write the
# host-visible copy, and --network host containers for host-netns actions.
set -e

REPO=/workspace/SE301-revision
HOST_SITE=/host/srv/se301-revision

# 1. Sync repo -> host-visible serving dir (root needed to write /host/srv)
docker exec hermes sh -c "mkdir -p $HOST_SITE && rm -rf $HOST_SITE/* $HOST_SITE/.[!.]* 2>/dev/null; cp -a $REPO/. $HOST_SITE/ && chown -R 10000:10000 $HOST_SITE"
echo "synced -> $HOST_SITE"

# 2. Site container: survives reboot via restart policy
if ! docker inspect se301-site >/dev/null 2>&1; then
  docker run -d --name se301-site --restart unless-stopped \
    -v /host/srv/se301-revision:/srv/site:ro \
    -p 127.0.0.1:8080:8080 \
    python:3.12-slim \
    python3 -m http.server 8080 --bind 0.0.0.0 --directory /srv/site
  echo "container se301-site created"
else
  docker start se301-site >/dev/null
  echo "container se301-site already exists (restarted)"
fi

# 3. Public routes: https://hermes-thinkpad.tail4651e2.ts.net/se301
#    --set-path adds the mount but drops funnel; funnel --bg restores root(/) -> 9120.
#    Order matters.
docker run --rm --network host -v /var/run/tailscale:/var/run/tailscale \
  tailscale/tailscale tailscale serve --bg --set-path /se301 http://127.0.0.1:8080
docker run --rm --network host -v /var/run/tailscale:/var/run/tailscale \
  tailscale/tailscale tailscale funnel --bg http://127.0.0.1:9120

# 4. Verify from the host netns
sleep 1
docker run --rm --network host python:3.12-slim python3 -c "
import http.client
def st(path):
    c = http.client.HTTPSConnection('hermes-thinkpad.tail4651e2.ts.net', 443, timeout=15)
    c.request('GET', path); r = c.getresponse(); r.read()
    print(path, '->', r.status)
    c.close()
st('/se301/')
st('/')
"