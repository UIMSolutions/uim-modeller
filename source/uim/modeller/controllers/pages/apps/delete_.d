module uim.modeller.controllers.pages.apps.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLApps",
  "MDLDelete",
  `this
    .collectionName("modeller_apps")
    .rootPath("/modeller/apps");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsDeletePageController); 
}}