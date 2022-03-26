module uim.modeller.views.libraries.index;

@safe:
import uim.modeller;
import uim.modeller.views.libraries;

class DMDLLibrariesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLLibrariesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":"/modeller/libraries"], "Bibliotheken")
    );

    auto headerTitle = titleList("Bibliotheken");
    auto bodyTitle = "Gefundene Bibliotheken";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht libraries"))
          .actions([["refresh", "list", "create"]]))
      .form(
        APPEntitiesListForm(this)
          .rootPath(this.rootPath)
          .content(
            EntitiesFormContent
            .rootPath(this.rootPath))
          .header(
            FormHeader
              .rootPath(this.rootPath)
              .mainTitle("Bibliotheken")
              .subTitle("Bibliotheken anzeigen")
              .actions([["print", "export"]]))); 
  }
  
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesIndexView~":DMDLLibrariesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/libraries")
          .mainTitle("Libraryle")
          .subTitle("Übersicht Libraryle")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesIndexView~":DMDLLibrariesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLLibrariesIndexView:toH5 -> ", this.rootPath);
    debug writeln("this.form.rootPath(",this.rootPath,")");

    return [
      H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], 
          this.form
          .rootPath(this.rootPath)
          .entities(this.entities)
          .toH5(options)
    )))].toH5;              
  }  */
}
mixin(APPViewCalls!("MDLLibrariesIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLLibrariesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLLibrariesIndexView); 
}}
