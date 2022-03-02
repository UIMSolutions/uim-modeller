module uim.modeller.controllers.pages.models.update;

@safe:
import uim.modeller;

class DMDLModelsUpdatePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLModelsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModelsUpdateView(this))
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
    debugMethodCall(moduleName!DMDLModelsUpdatePageController~":DMDLModelsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_models"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/models");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModelsUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsUpdatePageController); 
}}