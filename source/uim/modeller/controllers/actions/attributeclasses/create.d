module uim.modeller.controllers.actions.attributeclasses.create;

@safe:
import uim.modeller;

class DMDLAttributeClassCreateAction : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAttributeClassCreateAction"));

  override void initialize() {
    super.initialize;

    _initAttributeClassesAction(this);
  }
}
mixin(APPControllerCalls!("MDLAttributeClassCreateAction"));
