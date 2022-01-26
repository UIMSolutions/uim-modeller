module uim.modeller.controllers.pages.attributes.create;

@safe:
import uim.modeller;

class DMDLAttributesCreatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLAttributesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLAttributesCreateView(this))
    .scripts
      .addContents(
        editorSummary~
        editorText,
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

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "attributes"].createEntity;      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/mdl/attributes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesCreatePageController"));
