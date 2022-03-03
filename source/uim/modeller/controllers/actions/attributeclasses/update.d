module uim.modeller.controllers.actions.attributeclasses.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateAttributeClass : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateAttributeClass"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateAttributeClass"));
