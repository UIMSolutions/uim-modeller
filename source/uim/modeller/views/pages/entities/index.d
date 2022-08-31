module uim.modeller.views.pages.entities.index;

@safe:
import uim.modeller;

class DMDLEntityIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLEntityIndexView"));

  // Initial (static) parts of a view
  override void initialize() {
    super.initialize;

    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .title(titleView("Übersicht Entitäten"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
       .content(
          EntitiesFormContent(myForm))
        .header(
          FormHeader(myForm)
            .mainTitle("Entitäten")
            .subTitle("Entität anzeigen")
            .actions([["print", "export"]]));
    } 
  }

  // Set dynamic parts of a view
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
    
    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Entitäten"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .rootPath(
          this.rootPath);
    } 
  }
}
mixin(APPViewCalls!("MDLEntityIndexView"));