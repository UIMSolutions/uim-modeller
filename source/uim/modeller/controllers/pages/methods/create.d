module uim.modeller.controllers.pages.methods.create;

@safe:
import uim.modeller;

class DMDLMethodsCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLMethodsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_methods")
      .rootPath("/modeller/methods");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Methoden"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Methode erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
         .method("post").action(this.rootPath~"/actions/create")
        .content(MDLMethodFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neue Methode")
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
mixin(APPPageControllerCalls!("MDLMethodsCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsCreatePageController); 
}}
