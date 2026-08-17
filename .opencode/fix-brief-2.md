Small follow-up fix to index.html in this repo root (SE301 revision site). CHANGE ONLY what is listed; keep everything else byte-identical (the page was just redesigned — do not touch the design, colors, or any other content).

ADD to the Java examples section (the section titled "See ownership in Java") a third example about default constructors and constructor chaining:

- Section intro gains one short line: "If a class declares no constructor, Java inserts a default one."
- New example block, same visual style as the other two (card, "Java" label, syntax-highlighted code block, one-line code-note below):
  - Title: "Constructor chaining" (subtitle note: default constructors)
  - Code (~14 lines, matching the existing record/class style):
    class Grandparent { }                              // implicit default constructor: Grandparent() { super(); }
    class Parent extends Grandparent { }               // implicit: Parent() { super(); }  -> chains up to Grandparent
    final class Child extends Parent {
      Child() { super(); }                             // explicit, writes the chain by hand
      // if omitted, javac inserts this exact super() call
    }
  - Keep comments short and use the existing span-based syntax highlighting tokens (kw/type/str).
  - Code-note: "Constructors chain vertically up the hierarchy: Child -> Parent -> Grandparent -> Object. A default constructor appears when none is declared."

VERIFICATION: html-validate 0 errors, all new ids/anchors valid if any, git diff --check clean. Report changed files and the exact code block you added.