module uim.modeller.controllers.pages.controls.create;

@safe:
import uim.modeller;

class DMDLPackagesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLPackagesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_packages")
      .rootPath("/modeller/packages");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Pakete")
        .item(["active", "fw-bold"], "Erstellen")
      );

      pgHeader
        .title(titleCreate("Paket erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLPackageFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neues Pakete")
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
mixin(APPPageControllerCalls!("MDLPackagesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesCreatePageController); 
}}
