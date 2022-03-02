module uim.modeller.controllers.actions.apps.create;

@safe:
import uim.modeller;

class DMDLAction_CreateApp : DMDLAppAction {
  mixin(APPControllerThis!("MDLAction_CreateApp"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_CreateApp~":DMDLAction_CreateApp::beforeResponse");
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

          collection.insertOne(entity);
          debug writeln("entity.id = ", entity.id);

          options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
        }
      }
    }
	}
}
mixin(APPControllerCalls!("MDLAction_CreateApp"));
