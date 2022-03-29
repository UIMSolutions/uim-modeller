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
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Apps")
        .link(["active"], ["href":this.rootPath~"/create"], "Erstellen")
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("App erstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
        .rootPath(this.rootPath)
        .action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .rootPath(this.rootPath)
            .mainTitle("Neue App")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }
    }

    this
      .view(myView)
      .scripts
        .addContents(
          editorSummary~editorText,
          "window.addEventListener('load', (event) => {
            document.getElementById('entityForm').addEventListener('submit', event => {
              editorSummary.save();
              editorText.save();
            })
          });"
      );          
  }
}
mixin(APPPageControllerCalls!("MDLAppsCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsCreatePageController); 
}}
