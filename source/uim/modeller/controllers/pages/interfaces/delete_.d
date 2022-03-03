module uim.modeller.controllers.pages.interfaces.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLInterfaces",
  "MDLDelete",
  `this
    .collectionName("modeller_interfaces")
    .rootPath("/modeller/interfaces");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesDeletePageController); 
}}