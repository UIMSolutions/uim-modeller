module uim.modeller.controllers.pages.libraries.create;

@safe:
import uim.modeller;

class DMDLLibrariesCreatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLLibrariesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLLibrariesCreateView(this))
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
    debugMethodCall(moduleName!DMDLLibrariesCreatePageController~":DMDLLibrariesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_libraries"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/libraries");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesCreatePageController"));
