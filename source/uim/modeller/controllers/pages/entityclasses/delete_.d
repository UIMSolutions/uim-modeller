module uim.modeller.controllers.pages.entityclasses.delete_;

@safe:
import uim.modeller;

class DMDLEntityClassesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLEntityClassesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLEntityClassesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_entityclasses"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/entityclasses");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesDeletePageController); 
}}