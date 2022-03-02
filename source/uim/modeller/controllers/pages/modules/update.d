module uim.modeller.controllers.pages.modules.update;

@safe:
import uim.modeller;

class DMDLModulesUpdatePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLModulesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModulesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLModulesUpdatePageController~":DMDLModulesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_modules"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/modules");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModulesUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesUpdatePageController); 
}}