module uim.modeller.controllers.pages.interfaces.create;

@safe:
import uim.modeller;

class DMDLInterfacesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLInterfacesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_interfaces")
      .rootPath("/modeller/interfaces");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Interface")
        .item(["active fw-bold"], "Erstellen")
      );

      pgHeader
        .title(titleCreate("Attribut erstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(MDLInterfaceFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .mainTitle("Neues Interface")
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
mixin(APPPageControllerCalls!("MDLInterfacesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesCreatePageController); 
}}
