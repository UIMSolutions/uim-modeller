module uim.modeller.controllers.actions.packages;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.packages.create;
public import uim.modeller.controllers.actions.packages.update;
public import uim.modeller.controllers.actions.packages.delete_;

T _initPackagesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/packages") 
  .collectionName("modeller_packages");

  return action; 
}