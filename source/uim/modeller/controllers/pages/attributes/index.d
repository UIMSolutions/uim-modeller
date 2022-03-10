module uim.modeller.controllers.pages.attributes.index;

@safe:
import uim.modeller;

class DMDLAttributesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAttributesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributes")
      .view(
        MDLAttributesIndexView(this)
          .rootPath("/modeller/attributes"));
  }
}
mixin(APPPageControllerCalls!("MDLAttributesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesIndexPageController); 
}}