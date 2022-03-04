module uim.modeller.controllers.actions.models.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateModel : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateModel"));

  override void initialize() {
    super.initialize;

    this._initModelsAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateModel"));
