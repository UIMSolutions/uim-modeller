module uim.modeller.controllers.actions.entityclasses.create;

@safe:
import uim.modeller;

class DMDLAction_CreateEntityClass : DMDLEntityClassAction {
  mixin(APPControllerThis!("MDLAction_CreateEntityClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_CreateEntityClass~":DMDLAction_CreateEntityClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    debug writeln("appSession.site.name = ", appSession.site.name);
    if (auto tenant = database[appSession.site.name]) {
      if (auto collection = tenant[collectionName]) {
        auto entity = collection.cloneEntity.fromRequest(options);   
        collection.insertOne(entity);
        debug writeln("entity.id = ", entity.id);

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
  }
}
mixin(APPControllerCalls!("MDLAction_CreateEntityClass"));
