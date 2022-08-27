module uim.modeller.controllers.pages.packages.index;

@safe:
import uim.modeller;

class DMDLPackagesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLPackagesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        APPEntitiesListView(this))
      .rootPath("/modeller/packages")
      .collectionName("modeller_packages");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Packages")
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