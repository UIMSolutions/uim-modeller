module uim.modeller.controllers.pages.attributeclasses.create;

@safe:
import uim.modeller;

class DMDLAttributeClassesCreatePageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLAttributeClassesCreateView(this))
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
    debugMethodCall(moduleName!DMDLAttributeClassesUpdatePageController~":DMDLAttributeClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_attributeclasses"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/attributeclasses");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesCreatePageController"));
