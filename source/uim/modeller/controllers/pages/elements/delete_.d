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
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Packages")
        .item(["active", "fw-bold"], "Löschen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Package löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLPackageFormContent(myForm)); 
    
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

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsDeletePageController); 
}}