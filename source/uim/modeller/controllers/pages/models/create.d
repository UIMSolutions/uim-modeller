module uim.modeller.controllers.pages.models.create;

@safe:
import uim.modeller;

class DMDLModelsCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLModelsCreatePageController"));

   override void initialize() {
    super.initialize;

    this
    .view(
      MDLModelsCreateView(this))
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
    debugMethodCall(moduleName!DMDLModelsCreatePageController~":DMDLModelsCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_models"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/models");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLModelsCreatePageController"));
