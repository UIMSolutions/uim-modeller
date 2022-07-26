module uim.modeller.controllers.pages.elements.index;

@safe:
import uim.modeller;

class DMDLPackagesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLPackagesIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/packages")
      .collectionName("modeller_packages");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .item(["active", "fw-bold"], "Packages")
      );

      pgHeader
        .rootPath("/modeller/packages")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Packages"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/packages")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Packages")
            .subTitle("Packages anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLPackagesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLPackagesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesIndexPageController); 
}}