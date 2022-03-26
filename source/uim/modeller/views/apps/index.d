module uim.modeller.views.apps.index;

@safe:
import uim.modeller;
import uim.modeller.views.apps;

class DMDLAppsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLAppsIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Anwendungen")
    );

    auto headerTitle = titleList("Anwendungen");
    auto bodyTitle = "Gefundene Anwendungen";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Apps"))
          .actions([["refresh", "list", "create"]]))
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) { 
      frm.content(
        EntitiesFormContent
          .rootPath(this.rootPath));

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Anwendungen")
            .subTitle("Anwendungen anzeigen")
            .actions([["print", "export"]]));
      }      
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsIndexView~":DMDLAppsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/apps")
          .mainTitle("Apps")
          .subTitle("Übersicht Apps")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsIndexView~":DMDLAppsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLAppsIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLAppsIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAppsIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAppsIndexView); 
}}