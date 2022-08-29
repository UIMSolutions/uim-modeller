module uim.modeller.controllers.pages.apps.index;

@safe:
import uim.modeller;

class DMDLAppsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLAppsIndexPageController"));

override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/apps")
      .collectionName("modeller_apps");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Apps"]
      );

      pgHeader
        .rootPath("/modeller/apps")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Apps"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/apps")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Apps")
            .subTitle("Apps anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLAppsIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAppsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAppsIndexPageController); 
}}