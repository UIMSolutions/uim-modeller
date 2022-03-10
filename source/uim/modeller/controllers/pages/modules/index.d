module uim.modeller.controllers.pages.modules.index;

@safe:
import uim.modeller;

class DMDLModulesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLModulesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_modules")
      .view(
        MDLModulesIndexView(this)
          .rootPath("/modeller/modules"));
  }
}
mixin(APPPageControllerCalls!("MDLModulesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesIndexPageController); 
}}