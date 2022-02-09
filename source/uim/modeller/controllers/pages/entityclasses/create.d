module uim.modeller.controllers.pages.entityclasses.create;

@safe:
import uim.modeller;

class DMDLEntityClassesCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLEntityClassesCreateView(this))
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
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_entityclasses"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        entityView
          .entity(dbEntity)
          .crudMode(CRUDModes.Create)
          .rootPath("/modeller/entityclasses")
          .readonly(true);
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesCreatePageController"));
