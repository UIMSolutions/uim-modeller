module uim.modeller.controllers.pages.packages.delete_;

@safe:
import uim.modeller;

class DMDLPackagesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLPackagesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_packages")
      .rootPath("/modeller/packages");

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
mixin(APPPageControllerCalls!("MDLPackagesDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesDeletePageController); 
}}