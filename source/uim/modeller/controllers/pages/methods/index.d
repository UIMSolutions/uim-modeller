module uim.modeller.controllers.pages.methods.index;

@safe:
import uim.modeller;

class DMDLMethodsIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLMethodsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/methods")
      .collectionName("modeller_methods");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Methoden"]
      );

      pgHeader
        .rootPath("/modeller/methods")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Methoden"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/methods")
       .content(
          EntitiesFormContent)
        .header(
          FormHeader
            .mainTitle("Methoden")
            .subTitle("Methoden anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLMethodsIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsIndexPageController); 
}}