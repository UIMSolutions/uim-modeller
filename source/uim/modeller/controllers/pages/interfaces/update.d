module uim.modeller.controllers.pages.interfaces.update;

@safe:
import uim.modeller;

class DMDLInterfacesUpdatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLInterfacesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLInterfacesUpdateView(this))
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
    debugMethodCall(moduleName!DMDLInterfacesUpdatePageController~":DMDLInterfacesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", null);
    if (entityId && entityId.isUUID && this.database) {  
      if (auto dbEntity = database[appSession.site.name, "modeller_interfaces"].findOne(UUID(entityId))) {
        
        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          with(entityView) {
            entity(dbEntity);
            crudMode(CRUDModes.Update);
            rootPath("/modeller/interfaces");
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesUpdatePageController"));