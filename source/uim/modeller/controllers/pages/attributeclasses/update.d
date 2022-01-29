module uim.modeller.controllers.pages.attributeclasses.update;

@safe:
import uim.modeller;

class DMDLAttributeClassesUpdatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributeClassesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLAttributeClassesUpdatePageController~":DMDLAttributeClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "modeller_attributeclasses"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/attributeclasses");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesUpdatePageController"));