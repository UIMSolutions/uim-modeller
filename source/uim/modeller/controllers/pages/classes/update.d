module uim.modeller.controllers.pages.classes.update;

@safe:
import uim.modeller;

class DMDLClassesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLClassesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_classes")
      .rootPath("/modeller/classes");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Klassen"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Klasse anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLClassFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Klassen")
          .subTitle("Klasse anzeigen");
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
mixin(APPPageControllerCalls!("MDLClassesUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesUpdatePageController); 
}}