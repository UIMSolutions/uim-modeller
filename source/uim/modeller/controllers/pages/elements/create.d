module uim.modeller.controllers.pages.elements.create;

@safe:
import uim.modeller;

class DMDLElementsCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLElementsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_elements")
      .rootPath("/modeller/elements");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Elements"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("Paket erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLPackageFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neues Pakete")
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
mixin(APPPageControllerCalls!("MDLElementsCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsCreatePageController); 
}}
