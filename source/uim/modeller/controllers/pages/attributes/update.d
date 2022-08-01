module uim.modeller.controllers.pages.attributes.update;

@safe:
import uim.modeller;

class DMDLAttributesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLAttributesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributes")
      .rootPath("/modeller/attributes");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Attributes"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Attribute anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLAttributeFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Attributes")
          .subTitle("Attribute anzeigen");
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
mixin(APPPageControllerCalls!("MDLAttributesUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesUpdatePageController); 
}}