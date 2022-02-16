module uim.modeller.controllers.pages.classes.create;

@safe:
import uim.modeller;

class DMDLClassesCreatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLClassesCreateView(this))
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
    debugMethodCall(moduleName!DMDLClassesCreatePageController~":DMDLClassesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_classes"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/classes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLClassesCreatePageController"));
