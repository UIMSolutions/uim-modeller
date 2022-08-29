module uim.modeller.controllers.pages.entities.index;

@safe:
import uim.modeller;

class DMDLEntitiesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLEntitiesIndexPageController"));

override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/entities")
      .collectionName("modeller_entities");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Entitäten"]
      );

      pgHeader
        .rootPath("/modeller/entities")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Entitäten"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/entities")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Entitäten")
            .subTitle("Entität anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesIndexPageController); 
}}