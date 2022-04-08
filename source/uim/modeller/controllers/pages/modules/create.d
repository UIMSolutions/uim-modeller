module uim.modeller.controllers.pages.modules.create;

@safe:
import uim.modeller;

class DMDLModulesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLModulesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_modules")
      .rootPath("/modeller/modules");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Module")
        .item(["active", "fw-bold"], "Erstellen")
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Modul erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
         .method("post").action(this.rootPath~"/actions/create")
        .content(MDLModuleFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neues Module")
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
mixin(APPPageControllerCalls!("MDLModulesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesCreatePageController); 
}}
