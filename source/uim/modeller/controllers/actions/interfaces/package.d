module uim.modeller.controllers.actions.interfaces;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.interfaces.create;
public import uim.modeller.controllers.actions.interfaces.update;
public import uim.modeller.controllers.actions.interfaces.delete_;

T _initInterfacesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/interfaces") 
  .collectionName("modeller_interfaces"); 

  return action;
}