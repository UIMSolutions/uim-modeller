module uim.modeller.controllers.pages.classes.delete_;

@safe:
import uim.modeller;

class DMDLClassesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLClassesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_classes")
      .rootPath("/modeller/classes");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Klassen"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .title(titleDelete("Klasse erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(MDLClassFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Klasse")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
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
mixin(APPPageControllerCalls!("MDLClassesDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesDeletePageController); 
}}