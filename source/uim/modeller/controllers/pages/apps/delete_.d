module uim.modeller.controllers.pages.apps.delete_;

@safe:
import uim.modeller;

class DMDLAppsDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLAppsDeletePageController"));

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
        [this.rootPath, "Apps"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("App löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLAppFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apps")
          .subTitle("Apps löschen");
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
mixin(APPPageControllerCalls!("MDLAppsDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsDeletePageController); 
}}