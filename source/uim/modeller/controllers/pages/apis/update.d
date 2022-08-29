module uim.modeller.controllers.pages.apis.update;

@safe:
import uim.modeller;

class DMDLApisUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLApisUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apis")
      .rootPath("/modeller/apis");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Apis"],
        [this.rootPath~"/update", "Bearbeiten"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Api bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLApiFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apis")
          .subTitle("Api bearbeiten");
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
mixin(APPPageControllerCalls!("MDLApisUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisUpdatePageController); 
}}