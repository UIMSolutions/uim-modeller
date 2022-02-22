module uim.modeller.views.interfaces.index;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLInterfacesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Interfaces")
    );

    auto headerTitle = titleList("Interfaces");
    auto bodyTitle = "Gefundene Interfaces";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).rootPath(myRootPath).title(titleView("Übersicht Interfaces")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).rootPath(myRootPath).mainTitle("Interfaces").subTitle("Interfaces anzeigen").actions([["print", "export"]]))
        .body_(APPListFormBody(this.form).rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesIndexView~":DMDLInterfacesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/interfaces").mainTitle("Interfaces").subTitle("Übersicht Interfaces").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesIndexView~":DMDLInterfacesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DMDLInterfacesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLInterfacesIndexView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}