module uim.modeller.controllers.actions.models;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.models.create;
public import uim.modeller.controllers.actions.models.update;
public import uim.modeller.controllers.actions.models.delete_;

T _initModelsAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/models") 
  .collectionName("modeller_models");

  return action; 
}