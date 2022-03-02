module uim.modeller.controllers.actions.attributeclasses.create;

@safe:
import uim.modeller;

class DMDLAction_CreateAttributeClass : DMDLAttributeClassAction {
  mixin(APPControllerThis!("MDLAction_CreateAttributeClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_CreateAttributeClass~":DMDLAction_CreateAttributeClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    debug writeln(options);        
    debug writeln("appSession.site.name = ", appSession.site.name);
    auto tenant = database[appSession.site.name];
    auto collection = tenant[collectionName];
    auto entity = collection.createFromTemplate.fromRequest(options);   
    collection.insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("MDLAction_CreateAttributeClass"));
