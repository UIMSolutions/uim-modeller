module uim.modeller.controllers.pages.packages.read;

@safe:
import uim.modeller;

class DMDLPackagesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLPackagesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLPackagesReadView(this))
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesReadPageController~":DMDLPackagesReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_packages"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/modeller/packages");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLPackagesReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesReadPageController); 
}}