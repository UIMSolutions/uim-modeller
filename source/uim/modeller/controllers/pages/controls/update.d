module uim.modeller.controllers.pages.controls.update;

@safe:
import uim.modeller;

class DMDLControlsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLControlsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_controls")
      .rootPath("/modeller/controls");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Controls"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Control anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLControlFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Controls")
          .subTitle("Control anzeigen");
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
mixin(APPPageControllerCalls!("MDLControlsUpdatePageController"));
    
version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsUpdatePageController); 
}}