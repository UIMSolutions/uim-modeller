module uim.modeller.controllers.pages.attributes.read;

@safe:
import uim.modeller;

class DMDLAttributesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLAttributesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributes")
      .rootPath("/modeller/attributes");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Attributes"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Attribut anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLAttributeFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Attribute")
          .subTitle("Attribut anzeigen");
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
mixin(APPPageControllerCalls!("MDLAttributesReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesReadPageController); 
}}