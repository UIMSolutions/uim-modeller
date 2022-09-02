module uim.modeller.controllers.pages.entities.index;

@safe:
import uim.modeller;

class DMDLEntitiesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLEntitiesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entities")
      .view(
        MDLEntityIndexView(this))
      .collectionName("modeller_entities");
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesIndexPageController); 
}}