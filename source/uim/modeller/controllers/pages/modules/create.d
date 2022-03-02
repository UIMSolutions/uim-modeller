module uim.modeller.controllers.pages.modules.create;

@safe:
import uim.modeller;

class DMDLModulesCreatePageController : DMDLCreatePageController {
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

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_modules"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
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

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesCreatePageController); 
}}
