module uim.modeller.controllers.pages.attributeclasses.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLAttributeClasses",
  "MDLRead",
  `this
    .collectionName("modeller_attributeclasses")
    .rootPath("/modeller/attributeclasses")
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
		testPageController(new DMDLAttributeClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesReadPageController); 
}}