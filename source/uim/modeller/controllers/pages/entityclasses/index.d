module uim.modeller.controllers.pages.entityclasses.index;

@safe:
import uim.modeller;

class DMDLEntityClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entityclasses")
      .view(
        MDLEntityClassesIndexView(this)
          .rootPath("/modeller/entityclasses"));
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesIndexPageController); 
}}