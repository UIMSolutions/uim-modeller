module uim.modeller.controllers.pages.models.index;

@safe:
import uim.modeller;

class DMDLModelsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLModelsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/models")
      .collectionName("modeller_models");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        UIMBreadcrumbItem.link("/")("UIM"),
        UIMBreadcrumbItem.link("/modeller")("Modeller"),
        UIMBreadcrumbItem(["fw-bold"]).active(true)("Modelle")
      );

      pgHeader
        .rootPath("/modeller/models")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Modelle"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/models")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Modelle")
            .subTitle("Modelle anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLModelsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLModelsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsIndexPageController); 
}}