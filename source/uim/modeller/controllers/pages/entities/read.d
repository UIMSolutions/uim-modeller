module uim.modeller.controllers.pages.entities.read;

@safe:
import uim.modeller;

class DMDLEntitiesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLEntitiesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView = MDLEntityReadView(this)
      .rootPath(this.rootPath);

    string formId = myView.form.id;
    this
      .view(myView);
    
    this
      .view(myView)
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled(); editorText.disabled();"
        );
                       
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesReadPageController); 
}}