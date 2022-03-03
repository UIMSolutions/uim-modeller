module uim.modeller.controllers.actions.methods.create;

@safe:
import uim.modeller;

class DMDLAction_CreateMethod : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateMethod"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/methods") 
    .collectionName("modeller_methods"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateMethod"));
