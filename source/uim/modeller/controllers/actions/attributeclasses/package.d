module uim.modeller.controllers.actions.attributeclasses;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.attributeclasses.create;
public import uim.modeller.controllers.actions.attributeclasses.update;
public import uim.modeller.controllers.actions.attributeclasses.delete_;

T _initAttributeClassesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/attributeclasses") 
  .collectionName("modeller_attributeclasses");

  return action; 
}