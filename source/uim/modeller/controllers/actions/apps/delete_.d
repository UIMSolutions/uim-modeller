module uim.modeller.controllers.actions.apps.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteApp : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteApp"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteApp"));
