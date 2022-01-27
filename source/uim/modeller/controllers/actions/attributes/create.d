module uim.modeller.controllers.actions.attributes.create;

@safe:
import uim.modeller;

class DMDLAction_CreateAttribute : DMDLAttributeAction {
  mixin(APPControllerThis!("MDLAction_CreateAttribute"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_CreateAttribute~":DMDLAction_CreateAttribute::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    debug writeln("appSession.site.name = ", appSession.site.name);
    auto tenant = database[appSession.site.name];
    auto entity = tenant["attributes"].createEntity.fromRequest(options);   
    tenant["attributes"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("MDLAction_CreateAttribute"));
