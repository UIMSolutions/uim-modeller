module uim.modeller.controllers.pages.modules.index;

@safe:
import uim.modeller;

class DMDLModulesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLModulesIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/modules")
      .collectionName("modeller_modules");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Module"]
      );

      pgHeader
        .rootPath("/modeller/modules")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Module"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/modules")
       .content(
          EntitiesFormContent)
        .header(
          FormHeader
            .mainTitle("Module")
            .subTitle("Module anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLModulesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModulesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesIndexPageController); 
}}