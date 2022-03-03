module uim.modeller.controllers.actions.apis;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.apis.create;
public import uim.modeller.controllers.actions.apis.update;
public import uim.modeller.controllers.actions.apis.delete_;

void _initApiAction(DMDLAction action) {
  action
  .rootPath("/modeller/apis") 
  .collectionName("modeller_apis"); 
}