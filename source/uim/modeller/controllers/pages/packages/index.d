module uim.modeller.controllers.pages.packages.index;

@safe:
import uim.modeller;

class DMDLPackagesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLPackagesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_packages")
      .view(
        MDLPackagesIndexView(this)
          .rootPath("/modeller/packages"));
  }
}
mixin(APPPageControllerCalls!("MDLPackagesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesIndexPageController); 
}}