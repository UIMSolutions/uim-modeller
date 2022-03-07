module uim.modeller.controllers.actions.delete_;

@safe:
import uim.modeller;

class DMDLDeleteAction : DMDLAction {
  mixin(APPControllerThis!("MDLDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLDeleteAction~":DMDLDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (auto entity = collection.createFromTemplate) {             
      debug writeln("Created entity:", entity.id);

      entity.fromRequest(options);
      database[appSession.site.name, collectionName].removeOne(entity);

      options["redirect"] = rootPath;
    }
  }
}
mixin(APPControllerCalls!("MDLDeleteAction"));

version(test_uim_mdl) {
  unittest {
    // TODO
  }
}