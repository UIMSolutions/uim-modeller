module uim.modeller.controllers.pages.page;

@safe:
import uim.modeller;

class DMDLPageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLPageController"));
  mixin(OProperty!("string", "entityName"));

  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }
}
mixin(APPPageControllerCalls!("MDLPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPageController); 
}}