module uim.modeller.controllers.pages.modules.delete_;

@safe:
import uim.modeller;

class DMDLModulesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLModulesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLModulesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesDeletePageController~":DMDLModulesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_modules"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/modules");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModulesDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesDeletePageController); 
}}