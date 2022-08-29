module uim.modeller.controllers.pages.apis.delete_;

@safe:
import uim.modeller;

class DMDLApisDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLApisDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apis")
      .rootPath("/modeller/apis");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Apis"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Api löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLApiFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apis")
          .subTitle("Apis löschen");
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
mixin(APPPageControllerCalls!("MDLApisDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisDeletePageController); 
}}