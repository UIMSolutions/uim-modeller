module uim.modeller.controllers.pages.attributeclasses.read;

@safe:
import uim.modeller;

class DMDLAttributeClassesReadPageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributeClassesReadView(this))
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesReadPageController~":DMDLAttributeClassesReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["modeller", "attributeclasses"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/mdl/attributeclasses");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesReadPageController"));