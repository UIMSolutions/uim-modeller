module uim.modeller.controllers.actions.entityclasses;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.entityclasses.create;
public import uim.modeller.controllers.actions.entityclasses.update;
public import uim.modeller.controllers.actions.entityclasses.delete_;

T _initEntityClassesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/entityclasses") 
  .collectionName("modeller_entityclasses"); 

  return action;
}