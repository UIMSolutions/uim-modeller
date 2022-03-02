module uim.modeller.controllers.pages.apps.update;

@safe:
import uim.modeller;

class DMDLAppsUpdatePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLAppsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAppsUpdateView(this))
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
    debugMethodCall(moduleName!DMDLAppsUpdatePageController~":DMDLAppsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_apps"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/apps");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAppsUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsUpdatePageController); 
}}