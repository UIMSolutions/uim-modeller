module uim.modeller.controllers.pages.modules.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLModules",
  "MDLDelete",
  `this
    .collectionName("modeller_modules")
    .rootPath("/modeller/modules");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesDeletePageController); 
}}