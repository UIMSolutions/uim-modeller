module uim.modeller.controllers.pages.interfaces.delete_;

@safe:
import uim.modeller;

class DMDLInterfacesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLInterfacesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_interfaces")
      .rootPath("/modeller/interfaces");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Interfaces"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Löschen")
      );

      pgHeader
        .rootPath(this.rootPath)
        .title(titleDelete("Interface erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/delete")
        .rootPath(this.rootPath)
        .content(MDLInterfaceFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neues Interface")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
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
mixin(APPPageControllerCalls!("MDLInterfacesDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesDeletePageController); 
}}