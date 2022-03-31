module uim.modeller.controllers.pages.attributeclasses.read;

@safe:
import uim.modeller;

class DMDLAttributeClassesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributeclasses")
      .rootPath("/modeller/attributeclasses");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "AttributeClasses")
        .link(["active"], ["href":this.rootPath~"/read"], "Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleRead("AttributeClass anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .action(this.rootPath~"/actions/read")
        .content(
          MDLAttributeClassFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("AttributeClasses")
          .subTitle("AttributeClass anzeigen");
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
mixin(APPPageControllerCalls!("MDLAttributeClassesReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesReadPageController); 
}}