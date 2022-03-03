module uim.modeller.controllers.pages.packages.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLPackages",
  "MDLDelete",
  `this
    .collectionName("modeller_packages")
    .rootPath("/modeller/packages");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesDeletePageController); 
}}