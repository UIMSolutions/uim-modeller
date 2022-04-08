module uim.modeller.controllers.pages.entityclasses.read;

@safe:
import uim.modeller;

class DMDLEntityClassesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entityclasses")
      .rootPath("/modeller/entityclasses");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Entitätsklassen")
        .item(["active fw-bold"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Entitätsklasse anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/read")
        .content(
          MDLEntityClassFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Entitätsklassen")
          .subTitle("Entitätsklasse anzeigen");
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
mixin(APPPageControllerCalls!("MDLEntityClassesReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesReadPageController); 
}}