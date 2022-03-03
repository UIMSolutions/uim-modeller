module uim.modeller.controllers.pages.apis.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLApis",
  "MDLDelete",
  `this
    .collectionName("modeller_apis")
    .rootPath("/modeller/apis");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisDeletePageController); 
}}