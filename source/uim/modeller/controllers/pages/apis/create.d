module uim.modeller.controllers.pages.apis.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLApis",
  "MDLCreate",
  `this
    .collectionName("modeller_apis")
    .rootPath("/modeller/apis");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new MDLApisCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisCreatePageController); 
}}