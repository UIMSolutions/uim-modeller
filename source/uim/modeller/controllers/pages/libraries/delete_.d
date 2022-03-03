module uim.modeller.controllers.pages.libraries.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLLibraries",
  "MDLDelete",
  `this
    .collectionName("modeller_libraries")
    .rootPath("/modeller/libraries");`));
    
version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesDeletePageController); 
}}