module uim.modeller.controllers.pages.interfaces.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLInterfaces",
  "MDLRead",
  `this
    .collectionName("modeller_interfaces")
    .rootPath("/modeller/interfaces");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesReadPageController); 
}}