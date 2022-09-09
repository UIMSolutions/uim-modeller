module uim.modeller.controllers.pages.elements.read;

@safe:
import uim.modeller;

class DMDLElementsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLElementsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_elements")
      .rootPath("/modeller/elements");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
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
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLPackageFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Elements")
          .subTitle("Element anzeigen");
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
mixin(APPPageControllerCalls!("MDLElementsReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsReadPageController); 
}}