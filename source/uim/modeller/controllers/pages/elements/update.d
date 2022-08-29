module uim.modeller.controllers.pages.elements.update;

@safe:
import uim.modeller;

class DMDLElementsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLElementsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_elements")
      .rootPath("/modeller/elements");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Elements"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Element anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLPackageFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Elements")
          .subTitle("Element anzeigen");
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
mixin(APPPageControllerCalls!("MDLElementsUpdatePageController"));
    
version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsUpdatePageController); 
}}