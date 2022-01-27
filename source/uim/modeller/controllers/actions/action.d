module uim.modeller.controllers.actions.action;

@safe:
import uim.modeller;

class DMDLAction : DAPPActionController {
  mixin(APPControllerThis!("MDLAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  mixin(OProperty!("string", "collectionName"));
  mixin(OProperty!("string", "rootPath"));
}
mixin(APPControllerCalls!("MDLAction"));

version(test_uim_mdl) {
  unittest {
    // TODO
  }
}