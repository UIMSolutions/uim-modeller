module source.uim.modeller.controllers.pages.modules copy.create;

@safe:
import uim.modeller;

class DMDLModulesCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLModulesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLModulesCreateView(this))
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
    debugMethodCall(moduleName!DMDLModulesCreatePageController~":DMDLModulesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_modules"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/modules");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModulesCreatePageController"));
