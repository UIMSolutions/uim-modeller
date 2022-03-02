module uim.modeller.controllers.pages.entity;

@safe:
import uim.modeller;

class DMDLEntityPageController : DAPPEntityPageController {
  mixin(APPPageControllerThis!("MDLEntityPageController"));

  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }
}
mixin(APPPageControllerCalls!("MDLEntityPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityPageController); 
}}