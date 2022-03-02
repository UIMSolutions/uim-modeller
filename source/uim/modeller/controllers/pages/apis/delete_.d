module uim.modeller.controllers.pages.apis.delete_;

@safe:
import uim.modeller;

class DMDLApisDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLApisDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLApisDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisDeletePageController~":DMDLApisDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_apis"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/apis");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLApisDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisDeletePageController); 
}}