module uim.modeller.controllers.pages.controls.read;

@safe:
import uim.modeller;

class DMDLElementsControlsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLElementsControlsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_controls")
      .rootPath("/modeller/controls");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Packages")
        .link(["active"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Package anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLPackageFormContent(myForm)); 
    
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
mixin(APPPageControllerCalls!("MDLElementsControlsReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsControlsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsControlsReadPageController); 
}}