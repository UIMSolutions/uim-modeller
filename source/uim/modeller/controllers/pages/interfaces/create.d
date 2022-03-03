module uim.modeller.controllers.pages.interfaces.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLInterfaces",
  "MDLCreate",
  `this
    .collectionName("modeller_interfaces")
    .rootPath("/modeller/interfaces");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesCreatePageController); 
}}
