module uim.modeller.controllers.pages.classes.index;

@safe:
import uim.modeller;

class DMDLClassesIndexPageController : DMDLListPageController {
  mixin(APPPageControllerThis!("MDLClassesIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/classes")
      .collectionName("modeller_classes");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Klassen"]
      );

      pgHeader
        .rootPath("/modeller/classes")
        .breadcrumbs(bc)
        .title(titleView("Übersicht KLassen"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/classes")
       .content(
          EntitiesFormContent)
        .header(
          FormHeader
            .mainTitle("Klassen")
            .subTitle("KLassen anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLClassesIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesIndexPageController); 
}}