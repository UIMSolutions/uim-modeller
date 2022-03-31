module uim.modeller.controllers.pages.attributeclasses.delete_;

@safe:
import uim.modeller;

class DMDLAttributeClassesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributeclasses")
      .rootPath("/modeller/attributeclasses");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Attributeklasses")
        .item(["active", "fw-bold"], "Löschen")
      );

      pgHeader
        .title(titleDelete("Attribut löschen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(MDLAttributeClassFormContent);
    
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
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesDeletePageController"));


version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesDeletePageController); 
}}