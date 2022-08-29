module uim.modeller.controllers.pages.entities.read;

@safe:
import uim.modeller;

class DMDLEntitiesReadPageController : DMDLReadPageController {
  mixin(APPPageControllerThis!("MDLEntitiesReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Entitäten"],
        [this.rootPath~"/read", "Anzeigen"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Entitätsklasse anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/read")
        .content(
          MDLEntityFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Entitätsklassen")
          .subTitle("Entitätsklasse anzeigen");
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
mixin(APPPageControllerCalls!("MDLEntitiesReadPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesReadPageController); 
}}