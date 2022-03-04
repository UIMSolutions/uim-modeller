module uim.modeller.controllers.actions.apps;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.apps.create;
public import uim.modeller.controllers.actions.apps.update;
public import uim.modeller.controllers.actions.apps.delete_;

T _initAppsAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/apps") 
  .collectionName("modeller_apps");

  return action; 
}