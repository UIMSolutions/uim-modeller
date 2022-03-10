module uim.modeller.controllers.pages.attributeclasses.index;

@safe:
import uim.modeller;

class DMDLAttributeClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributeclasses")
      .view(
        MDLAttributeClassesIndexView(this)
          .rootPath("/modeller/attributeclasses"));
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesIndexPageController); 
}}