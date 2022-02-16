module uim.modeller.controllers.pages.apis.delete_;

@safe:
import uim.modeller;

class DMDLApisDeletePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLApisDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLApisDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisDeletePageController~":DMDLApisDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_apis"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/apis");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLApisDeletePageController"));