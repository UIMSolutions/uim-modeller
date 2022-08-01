module uim.modeller.controllers.pages.libraries.read;

@safe:
import uim.modeller;

class DMDLLibrariesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLLibrariesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_libraries")
      .rootPath("/modeller/libraries");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Bibliotheken"),
        UIMBreadcrumbItem.active(true)("Anzeigen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Bibliothek anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLLibraryFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Bibliotheken")
          .subTitle("Bibliothek anzeigen");
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
mixin(APPPageControllerCalls!("MDLLibrariesReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesReadPageController); 
}}