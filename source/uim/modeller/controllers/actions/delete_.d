module uim.modeller.controllers.actions.delete_;

@safe:
import uim.modeller;

class DMDLDeleteAction : DMDLAction {
  mixin(APPControllerThis!("MDLDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteApi~":DMDLAction_DeleteApi::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    debug writeln(options);        
    debug writeln("appSession.site.name = ", appSession.site.name);
    if (auto tenant = database[appSession.site.name]) {
      debug writeln("Found tenant for ", appSession.site.name);
      
      if (auto collection = tenant[collectionName]) {
        debug writeln("Found collection for ", collectionName);
        
        if (auto entity = collection.createFromTemplate) {             
          debug writeln("Created entity:", entity.id);

          entity.fromRequest(options);
          database[appSession.site.name, collectionName].removeOne(entity);

          options["redirect"] = rootPath;
        }
      }
    }
	}
}
mixin(APPControllerCalls!("MDLDeleteAction"));

version(test_uim_mdl) {
  unittest {
    // TODO
  }
}