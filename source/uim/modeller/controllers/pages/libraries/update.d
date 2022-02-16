module uim.modeller.controllers.pages.libraries.update;

@safe:
import uim.modeller;

class DMDLLibrariesUpdatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLLibrariesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLLibrariesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLLibrariesUpdatePageController~":DMDLLibrariesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_libraries"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/libraries");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesUpdatePageController"));