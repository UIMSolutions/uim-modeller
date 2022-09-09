module uim.modeller.controllers.pages.interfaces.create;

@safe:
import uim.modeller;

class DMDLInterfacesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLInterfacesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_interfaces")
      .rootPath("/modeller/interfaces");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Interfaces"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("Interface erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLInterfaceFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neues Interface")
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
mixin(APPPageControllerCalls!("MDLInterfacesCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesCreatePageController); 
}}
