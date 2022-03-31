module uim.modeller.controllers.pages.entityclasses.index;

@safe:
import uim.modeller;

class DMDLEntityClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesIndexPageController"));

override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/entityclasses")
      .collectionName("modeller_entityclasses");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .item(["active", "fw-bold"], "Entitätsklassen")
      );

      pgHeader
        .rootPath("/modeller/entityclasses")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Entitätsklassen"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/entityclasses")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Entitätsklassen")
            .subTitle("Entitätsklassen anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesIndexPageController); 
}}