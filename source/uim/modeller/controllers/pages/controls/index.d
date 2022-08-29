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
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Controls"]
      );

      pgHeader
        .rootPath("/modeller/controls")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Controls"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/controls")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Controls")
            .subTitle("Controls anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLControlsIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLControlsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLControlsIndexPageController); 
}}