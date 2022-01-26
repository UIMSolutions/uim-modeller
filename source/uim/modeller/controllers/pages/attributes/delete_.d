module uim.modeller.controllers.pages.attributes.delete_;

@safe:
import uim.modeller;

class DMDLAttributesDeletePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLAttributesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesUpdatePageController~":DMDLAttributesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "attributes"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/mdl/attributes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesDeletePageController"));