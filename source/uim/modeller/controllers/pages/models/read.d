module uim.modeller.controllers.pages.models.read;

@safe:
import uim.modeller;

class DMDLModelsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLModelsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModelsReadView(this))
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsReadPageController~":DMDLModelsReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_models"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/modeller/models");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModelsReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsReadPageController); 
}}