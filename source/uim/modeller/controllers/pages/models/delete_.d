module uim.modeller.controllers.pages.models.delete_;

@safe:
import uim.modeller;

class DMDLModelsDeletePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLModelsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModelsDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsUpdatePageController~":DMDLModelsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "modeller_models"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/models");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModelsDeletePageController"));