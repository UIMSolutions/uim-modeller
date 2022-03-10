module uim.modeller.controllers.pages.apps.index;

@safe:
import uim.modeller;

class DMDLAppsIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAppsIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apps")
      .view(
        MDLAppsIndexView(this)
          .rootPath("/modeller/apps"));
  }
}
mixin(APPPageControllerCalls!("MDLAppsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsIndexPageController); 
}}