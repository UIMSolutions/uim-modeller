module uim.modeller.controllers.actions.methods;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.methods.create;
public import uim.modeller.controllers.actions.methods.update;
public import uim.modeller.controllers.actions.methods.delete_;

T _initMethodsAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/methods") 
  .collectionName("modeller_methods");

  return action; 
}