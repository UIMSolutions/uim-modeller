module uim.modeller.controllers.pages.entities.update;

@safe:
import uim.modeller;

class DMDLEntitiesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLEntitiesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Entitäten"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Bearbeiten")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Entitätsklasse bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/update")
        .content(MDLEntityFormContent(myForm)); 
    
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
mixin(APPPageControllerCalls!("MDLEntitiesUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesUpdatePageController); 
}}