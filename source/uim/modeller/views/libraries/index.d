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
      .link(["active"], ["href":"/modeller/libraries"], "Libraryle")
    );

    auto headerTitle = titleList("Libraryle");
    auto bodyTitle = "Gefundene Libraryle";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).parameter("rootPath", myRootPath).parameter("title", titleView("Übersicht libraries")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).parameter("rootPath", myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).parameter("rootPath", myRootPath).parameter("mainTitle", "libraries").parameter("subTitle", "libraries anzeigen").actions([["print", "export"]]))
        .body_(APPListFormBody(this.form).parameter("rootPath", myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesIndexView~":DMDLLibrariesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/libraries").parameter("mainTitle", "Libraryle").parameter("subTitle", "Übersicht Libraryle").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesIndexView~":DMDLLibrariesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
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
    // TODO
}}