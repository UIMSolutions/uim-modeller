module uim.modeller.controllers.pages.models.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLModels",
  "MDLDelete",
  `this
    .collectionName("modeller_models")
    .rootPath("/modeller/models");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsDeletePageController); 
}}