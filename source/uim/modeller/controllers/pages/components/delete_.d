module uim.modeller.controllers.pages.components.delete_;

@safe:
import uim.modeller;

class DMDLComponentsDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLComponentsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_components")
      .rootPath("/modeller/components");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Komponenten"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .title(titleDelete("Komponente löschen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(MDLComponentFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Komponente")
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
mixin(APPPageControllerCalls!("MDLComponentsDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsDeletePageController); 
}}