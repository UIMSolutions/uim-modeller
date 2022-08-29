module uim.modeller.controllers.pages.libraries.update;

@safe:
import uim.modeller;

class DMDLLibrariesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLLibrariesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_libraries")
      .rootPath("/modeller/libraries");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Libraries"),
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Library anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLLibraryFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Libraries")
          .subTitle("Library anzeigen");
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
          );
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesUpdatePageController); 
}}