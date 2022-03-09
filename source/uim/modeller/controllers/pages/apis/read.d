module uim.modeller.controllers.pages.apis.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLApis",
  "MDLRead",
  `this
    .collectionName("modeller_apis")
    .rootPath("/modeller/apis")
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
		testPageController(new DMDLApisReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisReadPageController); 
}}