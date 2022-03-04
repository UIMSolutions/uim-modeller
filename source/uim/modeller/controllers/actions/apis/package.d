module uim.modeller.controllers.actions.apis;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.apis.create;
public import uim.modeller.controllers.actions.apis.update;
public import uim.modeller.controllers.actions.apis.delete_;

T _initApiAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/apis") 
  .collectionName("modeller_apis");

  return action; 
}