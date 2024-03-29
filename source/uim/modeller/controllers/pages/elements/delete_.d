module uim.modeller.controllers.pages.elements.delete_;

@safe:
import uim.modeller;

class DMDLElementsDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLElementsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_elements")
      .rootPath("/modeller/elements");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Elements"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Package löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLPackageFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Packages")
          .subTitle("Packages löschen");
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
mixin(APPPageControllerCalls!("MDLElementsDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsDeletePageController); 
}}