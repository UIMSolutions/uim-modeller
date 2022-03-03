module uim.modeller.controllers.pages.packages.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLPackages",
  "MDLCreate",
  `this
    .collectionName("modeller_packages")
    .rootPath("/modeller/packages");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesCreatePageController); 
}}
