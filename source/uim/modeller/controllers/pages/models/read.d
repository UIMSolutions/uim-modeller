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

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    //if (auto pgHeader = cast(DPageHeader)myView.header) {
/*       auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath) */

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Modelle"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Modell anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLModelFormContent(myForm)); 
    
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

version(test_uim_modeller) { unittest {
  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testPageController(new DMDLModelsReadPageController); 

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testPageController(MDLModelsReadPageController); 
}}