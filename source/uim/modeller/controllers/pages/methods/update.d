module uim.modeller.controllers.pages.methods.update;

@safe:
import uim.modeller;

class DMDLMethodsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLMethodsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_methods")
      .rootPath("/modeller/methods");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Methoden"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Method anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLMethodFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Methods")
          .subTitle("Method anzeigen");
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
mixin(APPPageControllerCalls!("MDLMethodsUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsUpdatePageController); 
}}