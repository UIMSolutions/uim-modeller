module uim.modeller.controllers.pages.apis.create;

@safe:
import uim.modeller;

class DMDLApisCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLApisCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apis")
      .rootPath("/modeller/apis");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Api erstellen"))
        .breadcrumbs(
          UIMBreadcrumb.items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Api"],
            [this.rootPath~"/create", "Erstellen"]
          )
        );
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(MDLApiFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neue Api")
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
mixin(APPPageControllerCalls!("MDLApisCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new MDLApisCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisCreatePageController); 
}}