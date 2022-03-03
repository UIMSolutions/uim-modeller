module uim.modeller.controllers.actions.interfaces.create;

@safe:
import uim.modeller;

class DMDLAction_CreateInterface : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateInterface"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/interfaces") 
    .collectionName("modeller_interfaces"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateInterface"));
