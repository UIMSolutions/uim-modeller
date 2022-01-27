module uim.modeller.controllers.actions.attributeclasses.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateAttributeClass : DMDLAttributeClassAction {
  mixin(APPControllerThis!("MDLAction_UpdateAttributeClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateAttributeClass~":DMDLAction_UpdateAttributeClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

    auto appSession = getAppSession(options);

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site.name, "attributeclasses"].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site.name, "attributeclasses"].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("MDLAction_UpdateAttributeClass"));
