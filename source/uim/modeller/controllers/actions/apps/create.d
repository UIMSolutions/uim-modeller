module uim.modeller.controllers.actions.apps.create;

@safe:
import uim.modeller;

class DMDLAction_CreateApp : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateApp"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateApp"));
