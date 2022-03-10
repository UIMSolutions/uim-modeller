module uim.modeller.controllers.pages.libraries.index;

@safe:
import uim.modeller;

class DMDLLibrariesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLLibrariesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_libraries")
      .view(
        MDLLibrariesIndexView(this)
          .rootPath("/modeller/libraries"));
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesIndexPageController); 
}}