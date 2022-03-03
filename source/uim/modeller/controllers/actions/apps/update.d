module uim.modeller.controllers.actions.apps.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateApp : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateApp"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateApp"));
