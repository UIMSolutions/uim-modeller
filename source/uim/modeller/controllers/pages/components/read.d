module uim.modeller.controllers.pages.components.read;

@safe:
import uim.modeller;

class DMDLComponentsReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLComponentsReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_components")
      .rootPath("/modeller/components");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Komponenten"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Komponente anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/read")
        .content(MDLComponentFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Komponenten")
          .subTitle("Komponente anzeigen");
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
mixin(APPPageControllerCalls!("MDLComponentsReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsReadPageController); 
}}