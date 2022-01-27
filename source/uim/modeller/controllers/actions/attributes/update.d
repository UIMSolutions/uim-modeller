module uim.modeller.controllers.actions.attributes.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateAttribute : DMDLAttributeAction {
  mixin(APPControllerThis!("MDLAction_UpdateAttribute"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateAttribute~":DMDLAction_UpdateAttribute::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site.name, "attributes"].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site.name, "attributes"].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("MDLAction_UpdateAttribute"));
