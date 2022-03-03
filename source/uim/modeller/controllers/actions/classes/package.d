module uim.modeller.controllers.actions.classes;

@safe:
import uim.modeller;

// Main
public import uim.modeller.controllers.actions.classes.action;

// C(R)UD
public import uim.modeller.controllers.actions.classes.create;
public import uim.modeller.controllers.actions.classes.update;
public import uim.modeller.controllers.actions.classes.delete_;

void _initClassesAction(DMDLAction action) {
  action
  .rootPath("/modeller/classes") 
  .collectionName("modeller_classes"); 
}