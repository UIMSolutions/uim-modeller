module uim.modeller.controllers.actions.entityclasses;

@safe:
import uim.modeller;

// Main
public import uim.modeller.controllers.actions.entityclasses.action;

// C(R)UD
public import uim.modeller.controllers.actions.entityclasses.create;
public import uim.modeller.controllers.actions.entityclasses.update;
public import uim.modeller.controllers.actions.entityclasses.delete_;

void _initEntityClassesAction(DMDLAction action) {
  action
  .rootPath("/modeller/entityclasses") 
  .collectionName("modeller_entityclasses"); 
}