module uim.modeller.controllers.actions.attributeclasses.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteAttributeClass : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteAttributeClass"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteAttributeClass"));
