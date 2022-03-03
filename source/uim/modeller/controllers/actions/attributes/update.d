module uim.modeller.controllers.actions.attributes.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateAttribute : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateAttribute"));

  override void initialize() {
    super.initialize;

    this._initAttributesAction;
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateAttribute"));
