module uim.modeller.controllers.pages.classes.delete_;

@safe:
import uim.modeller;

class DMDLClassesDeletePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLClassesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLClassesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLClassesDeletePageController~":DMDLClassesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_classes"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/classes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLClassesDeletePageController"));