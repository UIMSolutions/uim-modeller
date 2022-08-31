module uim.modeller.controllers.pages.entities.update;

@safe:
import uim.modeller;

class DMDLEntitiesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLEntitiesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView = MDLEntityUpdateView(this)
      .rootPath(this.rootPath);

    string formId = myView.form.id;
    this
      .view(myView);

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~formId~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
          );    
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesUpdatePageController); 
}}