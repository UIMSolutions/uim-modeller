module uim.modeller.controllers.pages.modules.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLModules",
  "MDLRead",
  `this
    .collectionName("modeller_modules")
    .rootPath("/modeller/modules");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesReadPageController); 
}}