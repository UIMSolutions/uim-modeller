module uim.modeller.controllers.pages.apps.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLApps",
  "MDLCreate",
  `this
    .collectionName("modeller_apps")
    .rootPath("/modeller/apps");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsCreatePageController); 
}}
