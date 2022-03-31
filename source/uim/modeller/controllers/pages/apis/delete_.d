module uim.modeller.controllers.pages.apis.delete_;

@safe:
import uim.modeller;

class DMDLApisDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLApisDeletePageController"));

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
        .link(["href":this.rootPath], "Apis")
        .item(["active fw-bold"], "Löschen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Api löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(
          MDLApiFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apis")
          .subTitle("Apis löschen");
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
mixin(APPPageControllerCalls!("MDLApisDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLApisDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisDeletePageController); 
}}