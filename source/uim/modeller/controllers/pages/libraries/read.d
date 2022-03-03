module uim.modeller.controllers.pages.libraries.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLLibraries",
  "MDLRead",
  `this
    .collectionName("modeller_libraries")
    .rootPath("/modeller/libraries");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesReadPageController); 
}}