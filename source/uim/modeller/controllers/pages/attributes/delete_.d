module uim.modeller.controllers.pages.attributes.delete_;

@safe:
import uim.modeller;

class DMDLAttributesDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("MDLAttributesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributes")
      .rootPath("/modeller/attributes");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Attributes"],
        [this.rootPath~"/delete", "Löschen"]
      );

      pgHeader
        .title(titleDelete("Attribute erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/delete")
        .content(MDLAttributeFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Attribute")
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
mixin(APPPageControllerCalls!("MDLAttributesDeletePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesDeletePageController); 
}}