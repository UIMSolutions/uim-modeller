module uim.modeller.controllers.pages.interfaces.update;

@safe:
import uim.modeller;

class DMDLInterfacesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLInterfacesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_interfaces")
      .rootPath("/modeller/interfaces");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Interfaces"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Interface anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLInterfaceFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Interfaces")
          .subTitle("Interface anzeigen");
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
mixin(APPPageControllerCalls!("MDLInterfacesUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesUpdatePageController); 
}}