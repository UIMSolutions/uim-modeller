module uim.modeller.controllers.pages.attributes.index;

@safe:
import uim.modeller;

class DMDLAttributesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLAttributesIndexPageController"));

override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/attributes")
      .collectionName("modeller_attributes");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Attributes")
      );

      pgHeader
        .rootPath("/modeller/attributes")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Attributes"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/attributes")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Attributes")
            .subTitle("Attributes anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLAttributesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesIndexPageController); 
}}