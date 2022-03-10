module uim.modeller.controllers.pages.models.index;

@safe:
import uim.modeller;

class DMDLModelsIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLModelsIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_models")
      .view(
        MDLModelsIndexView(this)
          .rootPath("/modeller/models"));
  }
}
mixin(APPPageControllerCalls!("MDLModelsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsIndexPageController); 
}}