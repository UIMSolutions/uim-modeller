module uim.modeller.controllers.actions.modules.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateModule : DMDLModuleAction {
  mixin(APPControllerThis!("MDLAction_UpdateModule"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateModule~":DMDLAction_UpdateModule::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site.name, collectionName].findOne(UUID(entityId));
      
      entity.fromRequest(options);
      foreach(name, _module; entity.modules) { // Workaround :-O
        if (auto booleanModule = cast(DOOPBooleanModule)_module) {
          if ("entity_"~name !in options) booleanModule.value(false);  
        }
      }

      database[appSession.site.name, collectionName].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("MDLAction_UpdateModule"));
