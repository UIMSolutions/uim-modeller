module uim.modeller.controllers.actions.attributes;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.attributes.create;
public import uim.modeller.controllers.actions.attributes.update;
public import uim.modeller.controllers.actions.attributes.delete_;

O _initAttributesAction(this O)(DMDLAction action) {
  action
  .rootPath("/modeller/attributes") 
  .collectionName("modeller_attributes"); 

  return cast(O)this;
}