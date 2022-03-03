module uim.modeller.controllers.actions.apps;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.apps.create;
public import uim.modeller.controllers.actions.apps.update;
public import uim.modeller.controllers.actions.apps.delete_;

void _initAppsAction(DMDLAction action) {
  action
  .rootPath("/modeller/apps") 
  .collectionName("modeller_apps"); 
}