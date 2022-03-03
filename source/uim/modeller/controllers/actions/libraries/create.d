module uim.modeller.controllers.actions.libraries.create;

@safe:
import uim.modeller;

class DMDLAction_CreateLibrary : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateLibrary"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/libraries") 
    .collectionName("modeller_libraries"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateLibrary"));
