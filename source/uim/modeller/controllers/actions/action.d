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
  mixin(OProperty!("DAPPSession", "appSession"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction~":DMDLAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    this.appSession = getAppSession(options);
  }
}
mixin(APPControllerCalls!("MDLAction"));

version(test_uim_mdl) {
  unittest {
    // TODO
  }
}