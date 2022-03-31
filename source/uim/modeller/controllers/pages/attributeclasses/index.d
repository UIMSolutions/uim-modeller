module uim.modeller.controllers.pages.attributeclasses.index;

@safe:
import uim.modeller;

class DMDLAttributeClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesIndexPageController"));

override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/attributeclasses")
      .collectionName("modeller_attributeclasses");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .item(["active", "fw-bold"], "Attributeclasses")
      );

      pgHeader
        .rootPath("/modeller/attributeclasses")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Attributklasses"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/attributeclasses")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Attributklassen")
            .subTitle("Attributklassen anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesIndexPageController); 
}}