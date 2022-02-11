module uim.modeller.controllers.pages.methods.create;

@safe:
import uim.modeller;

class DMDLMethodsCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLMethodsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLMethodsCreateView(this))
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
    debugMethodCall(moduleName!DMDLMethodsCreatePageController~":DMDLMethodsCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_methods"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/methods");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLMethodsCreatePageController"));
