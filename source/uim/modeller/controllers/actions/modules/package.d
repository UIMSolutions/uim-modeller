module uim.modeller.controllers.actions.modules;

@safe:
import uim.modeller;

// Main
public import uim.modeller.controllers.actions.modules.action;

// C(R)UD
public import uim.modeller.controllers.actions.modules.create;
public import uim.modeller.controllers.actions.modules.update;
public import uim.modeller.controllers.actions.modules.delete_;

void _initModulesAction(DMDLAction action) {
  action
  .rootPath("/modeller/modules") 
  .collectionName("modeller_modules"); 
}