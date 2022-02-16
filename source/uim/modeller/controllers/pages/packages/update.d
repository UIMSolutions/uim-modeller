module uim.modeller.controllers.pages.packages.update;

@safe:
import uim.modeller;

class DMDLPackagesUpdatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLPackagesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLPackagesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLPackagesUpdatePageController~":DMDLPackagesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_packages"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/packages");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLPackagesUpdatePageController"));