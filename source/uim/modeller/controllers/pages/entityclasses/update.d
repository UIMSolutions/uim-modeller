module uim.modeller.controllers.pages.entityclasses.update;

@safe:
import uim.modeller;

class DMDLEntityClassesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLEntityClassesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entityclasses")
      .rootPath("/modeller/entityclasses");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Entitätsklassen")
        .item(["active", "fw-bold"], "Bearbeiten")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Entitätsklasse bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/update")
        .content(MDLEntityClassFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Entitätsklassen")
          .subTitle("Entitätsklasse bearbeiten");
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
mixin(APPPageControllerCalls!("MDLEntityClassesUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesUpdatePageController); 
}}