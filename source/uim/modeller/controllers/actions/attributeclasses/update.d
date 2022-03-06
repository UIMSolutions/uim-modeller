module uim.modeller.controllers.actions.attributeclasses.update;

@safe:
import uim.modeller;

class DMDLAttributeClassUpdateAction : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAttributeClassUpdateAction"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAttributeClassUpdateAction"));
