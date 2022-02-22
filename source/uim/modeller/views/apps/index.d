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
      .link(["href":myRootPath], "Apps")
    );

    auto headerTitle = titleList("Apps");
    auto bodyTitle = "Gefundene Apps";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).rootPath(myRootPath).title(titleView("Übersicht Apps")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).rootPath(myRootPath).mainTitle("Apps").subTitle("Apps anzeigen").actions([["print", "export"]]))
        .body_(APPListFormBody(this.form).rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsIndexView~":DMDLAppsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/apps").mainTitle("Apps").subTitle("Übersicht Apps").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsIndexView~":DMDLAppsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
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
    // TODO
}}