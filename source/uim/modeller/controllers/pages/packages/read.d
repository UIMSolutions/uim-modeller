module uim.modeller.controllers.pages.packages.read;

@safe:
import uim.modeller;

class DMDLPackagesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLPackagesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_packages")
      .rootPath("/modeller/packages");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Pakete"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Package anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLPackageFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Packages")
          .subTitle("Package anzeigen");
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
mixin(APPPageControllerCalls!("MDLPackagesReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesReadPageController); 
}}