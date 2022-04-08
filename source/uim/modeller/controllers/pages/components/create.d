module uim.modeller.controllers.pages.components.create;

@safe:
import uim.modeller;

class DMDLComponentsCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLComponentsCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_components")
      .rootPath("/modeller/components");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Komponenten")
        .item(["active", "fw-bold"], "Erstellen")
      );

      pgHeader
        .title(titleCreate("Klasse erstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
         .method("post").action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .mainTitle("Neue Klasse")
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
mixin(APPPageControllerCalls!("MDLComponentsCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsCreatePageController); 
}}
