module uim.modeller.controllers.actions.models.create;

@safe:
import uim.modeller;

class DMDLAction_CreateModel : DMDLModelAction {
  mixin(APPControllerThis!("MDLAction_CreateModel"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_CreateModel~":DMDLAction_CreateModel::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    debug writeln("appSession.site.name = ", appSession.site.name);
    if (auto tenant = database[appSession.site.name]) {
      if (auto collection = tenant[collectionName]) {
        auto entity = collection.createFromTemplate.fromRequest(options);   
        collection.insertOne(entity);
        debug writeln("entity.id = ", entity.id);

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
  }
}
mixin(APPControllerCalls!("MDLAction_CreateModel"));
