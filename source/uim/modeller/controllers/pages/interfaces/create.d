module uim.modeller.controllers.pages.interfaces.create;

@safe:
import uim.modeller;

class DMDLInterfacesCreatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLInterfacesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLInterfacesCreateView(this))
    .scripts
      .addContents(
        editorSummary~
        editorText,
  `window.addEventListener('load', (event) => {
    document.getElementById("entityForm").addEventListener("submit", event => {
      editorSummary.save();
      editorText.save();
    })
  });`);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesCreatePageController~":DMDLInterfacesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_interfaces"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/interfaces");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesCreatePageController"));
