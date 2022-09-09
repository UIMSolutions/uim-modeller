module uim.modeller.views.pages.entities.index;

@safe:
import uim.modeller;

class DMDLEntityIndexView : DAPPEntitiesListView {
  mixin(ViewThis!("MDLEntityIndexView"));

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
        .header(
          FormHeader
            .mainTitle("Entitäten")
            .subTitle("Entität anzeigen")
            .actions([["print", "export"]]))
       .content(
          EntitiesFormContent);
    } 
  }
  
  override void _afterSetController() {
    writeln("_afterSetController");
    super._afterSetController;

    if (this.controller) {
      this
        .rootPath(this.controller.rootPath);
    }
  }

  // Set dynamic parts of a view
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityIndexView~":DMDLEntityIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    writeln("In DMDLEntityIndexView -> %s entities".format(entities.length));
    writeln("In DMDLEntityIndexView -> rootPath = '%s'".format(this.rootPath));
    
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
          this.rootPath)
       .content(
          EntitiesFormContent
            .entities(entities)
            .rootPath(this.rootPath));
    } 
  }
}
mixin(ViewCalls!("MDLEntityIndexView"));

version(test_uim_modeller) { unittest {
  assert(MDLEntityIndexView);
}}