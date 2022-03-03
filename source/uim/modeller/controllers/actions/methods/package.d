module uim.modeller.controllers.actions.methods;

@safe:
import uim.modeller;

// Main
public import uim.modeller.controllers.actions.methods.action;

// C(R)UD
public import uim.modeller.controllers.actions.methods.create;
public import uim.modeller.controllers.actions.methods.update;
public import uim.modeller.controllers.actions.methods.delete_;

void _initMethodsAction(DMDLAction action) {
  action
  .rootPath("/modeller/methods") 
  .collectionName("modeller_methods"); 
}