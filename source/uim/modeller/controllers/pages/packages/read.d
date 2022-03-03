module uim.modeller.controllers.pages.packages.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLPackages",
  "MDLRead",
  `this
    .collectionName("modeller_packages")
    .rootPath("/modeller/packages");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesReadPageController); 
}}