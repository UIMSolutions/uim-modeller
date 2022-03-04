module uim.modeller.controllers.actions.models.create;

@safe:
import uim.modeller;

class DMDLAction_CreateModel : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateModel"));

  override void initialize() {
    super.initialize;

    this._initModelsAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateModel"));
