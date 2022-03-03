module uim.modeller.controllers.actions.classes.create;

@safe:
import uim.modeller;

class DMDLAction_CreateClass : DMDLClassAction {
  mixin(APPControllerThis!("MDLAction_CreateClass"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/classes") 
    .collectionName("modeller_classes"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateClass"));
