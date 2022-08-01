module uim.modeller.controllers.pages.methods.delete_;

@safe:
import uim.modeller;

class DMDLMethodsDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLMethodsDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_methods")
      .rootPath("/modeller/methods");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Methods"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Löschen")
      );

      pgHeader
        .breadcrumbs(bc)
        .rootPath(this.rootPath)
        .title(titleDelete("Method löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLMethodFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .rootPath(this.rootPath)
          .mainTitle("Methods")
          .subTitle("Methods löschen");
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
mixin(APPPageControllerCalls!("MDLMethodsDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsDeletePageController); 
}}