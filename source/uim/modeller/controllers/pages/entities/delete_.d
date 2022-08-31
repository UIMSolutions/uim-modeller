module uim.modeller.controllers.pages.entities.delete_;

@safe:
import uim.modeller;

class DMDLEntitiesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLEntitiesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView = MDLEntityDeleteView(this)
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
mixin(APPPageControllerCalls!("MDLEntitiesDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesDeletePageController); 
}}