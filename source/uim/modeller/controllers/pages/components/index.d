module uim.modeller.controllers.pages.components.index;

@safe:
import uim.modeller;

class DMDLComponentsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLComponentsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/components")
      .collectionName("modeller_components");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Komponenten"]
      );

      pgHeader
        .rootPath("/modeller/components")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Komponenten"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/components")
       .content(EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Komponenten")
            .subTitle("Komponenten anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLComponentsIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsIndexPageController); 
}}