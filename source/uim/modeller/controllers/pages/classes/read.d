module uim.modeller.controllers.pages.classes.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLClasses",
  "MDLRead",
  `this
    .collectionName("modeller_classes")
    .rootPath("/modeller/classes")
    .scripts
      .addContents(
        editorSummary~
        editorText~
        "editorSummary.disabled();"~
        "editorText.disabled();"
      );
`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesReadPageController); 
}}