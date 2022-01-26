module uim.modeller.controllers.pages.entityclasses.update;

@safe:
import uim.modeller;

class DMDLEntityClassesUpdatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLEntityClassesUpdateView(this))
      .scripts
        .addContents(
          editorSummary~editorText,
    `window.addEventListener('load', (event) => {
      document.getElementById("entityForm").addEventListener("submit", event => {
        editorSummary.save();
        editorText.save();
      })
    });`);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "entityclasses"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/mdl/entityclasses");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesUpdatePageController"));