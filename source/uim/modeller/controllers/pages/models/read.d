module uim.modeller.controllers.pages.models.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLModels",
  "MDLRead",
  `this
    .collectionName("modeller_models")
    .rootPath("/modeller/models");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsReadPageController); 
}}