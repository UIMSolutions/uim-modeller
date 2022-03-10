module uim.modeller.controllers.pages.classes.index;

@safe:
import uim.modeller;

class DMDLClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLClassesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_classes")
      .view(
        MDLClassesIndexView(this)
          .rootPath("/modeller/classes"));
  }
}
mixin(APPPageControllerCalls!("MDLClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesIndexPageController); 
}}