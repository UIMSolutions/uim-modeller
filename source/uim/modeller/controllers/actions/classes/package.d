module uim.modeller.controllers.actions.classes;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.classes.create;
public import uim.modeller.controllers.actions.classes.update;
public import uim.modeller.controllers.actions.classes.delete_;

T _initClassesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/classes") 
  .collectionName("modeller_classes");

  return action;
}