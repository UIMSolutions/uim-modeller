module uim.modeller.controllers.pages.libraries.create;

@safe:
import uim.modeller;

class DMDLLibrariesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLLibrariesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_libraries")
      .rootPath("/modeller/libraries");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Bibliotheken"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Bibliothek erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
         .method("post").action(this.rootPath~"/actions/create")
        .content(MDLLibraryFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neue Bibliothek")
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
mixin(APPPageControllerCalls!("MDLLibrariesCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesCreatePageController); 
}}
