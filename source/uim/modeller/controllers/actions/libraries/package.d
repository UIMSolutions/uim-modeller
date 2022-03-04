module uim.modeller.controllers.actions.libraries;

@safe:
import uim.modeller;

// C(R)UD
public import uim.modeller.controllers.actions.libraries.create;
public import uim.modeller.controllers.actions.libraries.update;
public import uim.modeller.controllers.actions.libraries.delete_;

T _initLibrariesAction(T:DMDLAction)(T action) {
  action
  .rootPath("/modeller/libraries") 
  .collectionName("modeller_libraries");

  return action; 
}