module uim.modeller.controllers.pages.apis.index;

@safe:
import uim.modeller;

class DMDLApisIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLApisIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apis")
      .view(
        MDLApisIndexView(this)
         .rootPath("/modeller/apis"));
  }
}
mixin(APPPageControllerCalls!("MDLApisIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisIndexPageController); 
}}