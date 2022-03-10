module uim.modeller.controllers.pages.interfaces.index;

@safe:
import uim.modeller;

class DMDLInterfacesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLInterfacesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_interfaces")      
      .view(
        MDLInterfacesIndexView(this)
          .rootPath("/modeller/interfaces"));
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesIndexPageController); 
}}