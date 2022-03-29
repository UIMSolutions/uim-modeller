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
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Attribute")
        .link(["active"], ["href":this.rootPath~"/create"], "Erstellen")
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Attribut erstellen"))
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
            .mainTitle("Neues Attribute")
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
mixin(APPPageControllerCalls!("MDLApisCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new MDLApisCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisCreatePageController); 
}}