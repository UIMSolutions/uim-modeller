module uim.modeller.controllers.actions.attributeclasses;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.attributeclasses.create;
public import uim.modeller.controllers.actions.attributeclasses.update;
public import uim.modeller.controllers.actions.attributeclasses.delete_;

void _initAttributeClassesAction(DMDLAction action) {
  action
  .rootPath("/modeller/attributeclasses") 
  .collectionName("modeller_attributeclasses"); 
}