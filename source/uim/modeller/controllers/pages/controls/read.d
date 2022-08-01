module uim.modeller.controllers.pages.controls.read;

@safe:
import uim.modeller;

class DMDLControlsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLControlsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_controls")
      .rootPath("/modeller/controls");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Controls"),
        UIMBreadcrumbItem.active(true)("Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Control bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLControlFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Controls")
          .subTitle("Control bearbeiten");
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
mixin(APPPageControllerCalls!("MDLControlsReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsReadPageController); 
}}