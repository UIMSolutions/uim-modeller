module uim.modeller.controllers.pages.attributeclasses.create;

@safe:
import uim.modeller;

class DMDLAttributeClassesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributeclasses")
      .rootPath("/modeller/attributeclasses");

    auto myView =  
      APPEntityCreateView(this)
        .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Attributklasse")
        .link(["active"], ["href":this.rootPath~"/create"], "Erstellen")
      );

      pgHeader
        .title(titleCreate("Attributklasseerstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .mainTitle("Neue Attributklasse")
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
mixin(APPPageControllerCalls!("MDLAttributeClassesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesCreatePageController); 
}}
