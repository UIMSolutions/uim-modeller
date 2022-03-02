module uim.modeller.controllers.pages.attributes.read;

@safe:
import uim.modeller;

class DMDLAttributesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLAttributesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributesReadView(this))
      .scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesReadPageController~":DMDLAttributesReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_attributes"].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Read);
            rootPath("/modeller/attributes");
            readonly(true);
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesReadPageController); 
}}