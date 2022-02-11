module uim.modeller.controllers.pages.modules.delete_;

@safe:
import uim.modeller;

class DMDLModulesDeletePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLModulesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModulesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesDeletePageController~":DMDLModulesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "modeller_modules"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/modules");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModulesDeletePageController"));