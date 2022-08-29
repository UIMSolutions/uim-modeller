module uim.modeller.controllers.pages.apps.create;

@safe:
import uim.modeller;

class DMDLAppsCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLAppsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_apps")
      .rootPath("/modeller/apps");

    auto myView =  
      APPEntityCreateView(this)
        .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Apps"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("App erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue App")
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
mixin(APPPageControllerCalls!("MDLAppsCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsCreatePageController); 
}}
