module uim.modeller.controllers.actions.packages;

@safe:
import uim.modeller;

// Main
public import uim.modeller.controllers.actions.packages.action;

// C(R)UD
public import uim.modeller.controllers.actions.packages.create;
public import uim.modeller.controllers.actions.packages.update;
public import uim.modeller.controllers.actions.packages.delete_;

void _initPackagesAction(DMDLAction action) {
  action
  .rootPath("/modeller/packages") 
  .collectionName("modeller_packages"); 
}