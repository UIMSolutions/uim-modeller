module uim.modeller.controllers.pages.methods.index;

@safe:
import uim.modeller;

class DMDLMethodsIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLMethodsIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_methods")
      .view(
        MDLMethodsIndexView(this)
          .rootPath("/modeller/methods"));
  }
}
mixin(APPPageControllerCalls!("MDLMethodsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsIndexPageController); 
}}