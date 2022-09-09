module uim.modeller.controllers.pages.elements.index;

@safe:
import uim.modeller;

class DMDLElementsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLElementsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/elements")
      .collectionName("modeller_elements");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Elements"]
      );

      pgHeader
        .rootPath("/modeller/elements")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Elements"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/elements")
       .content(
          EntitiesFormContent)
        .header(
          FormHeader
            .mainTitle("Elements")
            .subTitle("Elements anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLElementsIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLElementsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLElementsIndexPageController); 
}}