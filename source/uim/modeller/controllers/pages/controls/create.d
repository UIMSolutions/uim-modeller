module uim.modeller.controllers.pages.controls.create;

@safe:
import uim.modeller;

class DMDLControlsCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLControlsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_controls")
      .rootPath("/modeller/controls");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Controls"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("Paket erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLControlFormContent);
    
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
mixin(APPPageControllerCalls!("MDLControlsCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsCreatePageController); 
}}
