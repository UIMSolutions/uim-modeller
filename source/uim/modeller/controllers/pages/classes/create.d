module uim.modeller.controllers.pages.classes.create;

@safe:
import uim.modeller;

class DMDLClassesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_classes")
      .rootPath("/modeller/classes");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem.link(this.rootPath)("Klassen"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Erstellen")
      );

      pgHeader
        .title(titleCreate("Klasse erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Klasse")
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
mixin(APPPageControllerCalls!("MDLClassesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesCreatePageController); 
}}
