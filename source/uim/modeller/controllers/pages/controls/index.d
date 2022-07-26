module uim.modeller.controllers.pages.controls.index;

@safe:
import uim.modeller;

class DMDLControlsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLControlsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/controls")
      .collectionName("modeller_controls");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .item(["active", "fw-bold"], "Packages")
      );

      pgHeader
        .rootPath("/modeller/controls")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Packages"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/controls")
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
mixin(APPPageControllerCalls!("MDLControlsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsIndexPageController); 
}}