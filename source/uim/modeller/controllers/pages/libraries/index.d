module uim.modeller.controllers.pages.libraries.index;

@safe:
import uim.modeller;

class DMDLLibrariesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLLibrariesIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/libraries")
      .collectionName("modeller_libraries");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Bibliotheken"]
      );

      pgHeader
        .rootPath("/modeller/libraries")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Bibliotheken"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/libraries")
       .content(
          EntitiesFormContent)
        .header(
          FormHeader
            .mainTitle("Bibliotheken")
            .subTitle("Bibliotheken anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLLibrariesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLLibrariesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesIndexPageController); 
}}