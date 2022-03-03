module uim.modeller.controllers.actions.attributeclasses.create;

@safe:
import uim.modeller;

class DMDLAction_CreateAttributeClass : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateAttributeClass"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_CreateAttributeClass"));
