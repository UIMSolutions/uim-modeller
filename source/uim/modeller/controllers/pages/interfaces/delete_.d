module uim.modeller.controllers.pages.interfaces.delete_;

@safe:
import uim.modeller;

class DMDLInterfacesDeletePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLInterfacesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLInterfacesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesDeletePageController~":DMDLInterfacesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, "modeller_interfaces"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/interfaces");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesDeletePageController); 
}}