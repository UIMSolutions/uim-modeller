module uim.modeller.controllers.pages.methods.delete_;

@safe:
import uim.modeller;

class DMDLMethodsDeletePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLMethodsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLMethodsDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsDeletePageController~":DMDLMethodsDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "modeller_methods"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/methods");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLMethodsDeletePageController"));