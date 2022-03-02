module uim.modeller.controllers.pages.entities;

@safe:
import uim.modeller;

class DMDLEntitiesPageController : DAPPEntitiesPageController {
  mixin(APPPageControllerThis!("MDLEntitiesPageController"));

  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesPageController); 
}}