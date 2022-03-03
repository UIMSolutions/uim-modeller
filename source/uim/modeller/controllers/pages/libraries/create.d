module uim.modeller.controllers.pages.libraries.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLLibraries",
  "MDLCreate",
  `this
    .collectionName("modeller_libraries")
    .rootPath("/modeller/libraries");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesCreatePageController); 
}}
