module uim.modeller.controllers.pages.libraries.delete_;

@safe:
import uim.modeller;

class DMDLLibrariesDeletePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLLibrariesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLLibrariesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesDeletePageController~":DMDLLibrariesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_libraries"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/libraries");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesDeletePageController"));