module uim.modeller.controllers.pages.models.update;

@safe:
import uim.modeller;

class DMDLModelsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLModelsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_models")
      .rootPath("/modeller/models");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Models")
        .item(["active fw-bold"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Model anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .action(this.rootPath~"/actions/update")
        .content(
          MDLModelFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Models")
          .subTitle("Model anzeigen");
      }
    }

    this
      .view(myView)
      .scripts
        .addContents(
          editorSummary~editorText,
          "window.addEventListener('load', (event) => {
            document.getElementById('entityForm').addEventListener('submit', event => {
              editorSummary.save();
              editorText.save();
            })
          });"
        );
  }
}
mixin(APPPageControllerCalls!("MDLModelsUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsUpdatePageController); 
}}