module uim.modeller.controllers.pages.attributes.create;

@safe:
import uim.modeller;

class DMDLAttributesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLAttributesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_attributes")
      .rootPath("/modeller/attributes");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Attributes"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("Attribut erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neues Attribute")
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
mixin(APPPageControllerCalls!("MDLAttributesCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesCreatePageController); 
}}
