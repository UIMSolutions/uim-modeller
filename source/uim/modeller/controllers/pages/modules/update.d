module uim.modeller.controllers.pages.modules.update;

@safe:
import uim.modeller;

class DMDLModulesUpdatePageController : DMDLUpdatePageController {
  mixin(APPPageControllerThis!("MDLModulesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_modules")
      .rootPath("/modeller/modules");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Module"],
        [this.rootPath~"/update", "Bearbeiten"]
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleCreate("Modul bearbeiten"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          MDLModuleFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Module")
          .subTitle("Modul bearbeiten");
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
mixin(APPPageControllerCalls!("MDLModulesUpdatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesUpdatePageController); 
}}