module uim.modeller.controllers.pages.attributes.create;

@safe:
import uim.modeller;

class DMDLAttributesCreatePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLAttributesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .view(
      MDLAttributesCreateView(this))
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
    debugMethodCall(moduleName!DMDLAttributesCreatePageController~":DMDLAttributesCreatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database["uim", "modeller_attributes"].cloneEntity;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath("/modeller/attributes");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesCreatePageController"));
