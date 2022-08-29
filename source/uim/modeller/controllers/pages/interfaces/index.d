module uim.modeller.controllers.pages.interfaces.index;

@safe:
import uim.modeller;

class DMDLInterfacesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLInterfacesIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/interfaces")
      .collectionName("modeller_interfaces");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Interfaces"]
      );

      pgHeader
        .rootPath("/modeller/interfaces")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Interfaces"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/interfaces")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Interfaces")
            .subTitle("Interfaces anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLInterfacesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesIndexPageController); 
}}