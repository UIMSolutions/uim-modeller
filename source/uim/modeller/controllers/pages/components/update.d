module uim.modeller.controllers.pages.components.update;

@safe:
import uim.modeller;

class DMDLComponentsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLComponentsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_components")
      .rootPath("/modeller/components");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Komponenten"],
        [this.rootPath~"/update", "Bearbeiten"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Komponente bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/update")
        .content(MDLComponentFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Neue Komponente")
          .subTitle("Komponente bearbeiten");
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
mixin(APPPageControllerCalls!("MDLComponentsUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsUpdatePageController); 
}}