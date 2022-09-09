module uim.modeller.controllers.pages.classes.read;

@safe:
import uim.modeller;

class DMDLClassesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLClassesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_classes")
      .rootPath("/modeller/classes");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Klassen"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Klasse anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          MDLClassFormContent); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("KLassen")
          .subTitle("Klasse anzeigen");
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
mixin(APPPageControllerCalls!("MDLClassesReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesReadPageController); 
}}