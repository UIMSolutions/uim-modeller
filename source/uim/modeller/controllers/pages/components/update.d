module uim.modeller.controllers.pages.components.update;

@safe:
import uim.modeller;

class DMDLComponentsUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLComponentsUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_components")
      .rootPath("/modeller/components");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "components")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Class anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLClassFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("components")
          .subTitle("Class anzeigen");
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
mixin(APPPageControllerCalls!("MDLComponentsUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsUpdatePageController); 
}}