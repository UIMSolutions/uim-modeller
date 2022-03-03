module uim.modeller.controllers.pages.models.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLModels",
  "MDLCreate",
  `this
    .collectionName("modeller_models")
    .rootPath("/modeller/models");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsCreatePageController); 
}}
