module uim.modeller.controllers.pages.models.read;

@safe:
import uim.modeller;

class DMDLModelsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLModelsReadPageController"));

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
        .link(["href":this.rootPath], "Modelle")
        .link(["active"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Modell anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .action(this.rootPath~"/actions/read")
        .content(
          MDLModelFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Modelle")
          .subTitle("Modell anzeigen");
      }
    }

    this
      .view(myView)
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );
  }
}
mixin(APPPageControllerCalls!("MDLModelsReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsReadPageController); 
}}