module uim.modeller.controllers.actions.modules;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.modules.create;
public import uim.modeller.controllers.actions.modules.update;
public import uim.modeller.controllers.actions.modules.delete_;

T _initModulesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/modules") 
  .collectionName("modeller_modules");

  return action; 
}