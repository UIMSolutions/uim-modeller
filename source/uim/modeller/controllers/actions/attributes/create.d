module uim.modeller.controllers.actions.attributes.create;

@safe:
import uim.modeller;

class DMDLAction_CreateAttribute : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateAttribute"));

  override void initialize() {
    super.initialize;

    this._initAttributesAction;
  }
}
mixin(APPControllerCalls!("MDLAction_CreateAttribute"));
