module uim.modeller.controllers.actions.models.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteModel : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteModel"));

  override void initialize() {
    super.initialize;

    this._initModelsAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteModel"));
