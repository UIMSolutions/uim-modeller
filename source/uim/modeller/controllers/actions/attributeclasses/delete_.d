module uim.modeller.controllers.actions.attributeclasses.delete_;

@safe:
import uim.modeller;

class DMDLAttributeClassDeleteAction : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAttributeClassDeleteAction"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAttributeClassDeleteAction"));
