module uim.modeller.controllers.pages.controls.delete_;

@safe:
import uim.modeller;

class DMDLControlsDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLControlsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_controls")
      .rootPath("/modeller/controls");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Controls"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Control löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLControlFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Controls")
          .subTitle("Controls löschen");
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
mixin(APPPageControllerCalls!("MDLControlsDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsDeletePageController); 
}}