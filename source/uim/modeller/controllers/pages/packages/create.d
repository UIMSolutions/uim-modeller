module uim.modeller.controllers.pages.packages.create;

@safe:
import uim.modeller;

class DMDLPackagesCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLPackagesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLPackagesCreateView(this))
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
    debugMethodCall(moduleName!DMDLPackagesCreatePageController~":DMDLPackagesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_packages"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/packages");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLPackagesCreatePageController"));
