module uim.modeller.controllers.pages.attributes.update;

@safe:
import uim.modeller;

class DMDLAttributesUpdatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLAttributesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLAttributesUpdatePageController~":DMDLAttributesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database["uim", "attributes"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/mdl/attributes");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesUpdatePageController"));