module uim.modeller.views.modules.index;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLModulesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":"/modeller/modules"], "Module")
    );

    auto headerTitle = titleList("Module");
    auto bodyTitle = "Gefundene Module";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).parameter("rootPath", myRootPath).parameter("title", titleView("Übersicht Modules")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).parameter("rootPath", myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).parameter("rootPath", myRootPath).parameter("mainTitle", "Modules").parameter("subTitle", "Modules anzeigen").actions([["print", "export"]]))
        .body_(APPListFormBody(this.form).parameter("rootPath", myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesIndexView~":DMDLModulesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/modules").parameter("mainTitle", "Module").parameter("subTitle", "Übersicht Module").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesIndexView~":DMDLModulesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
    debug writeln("RootPath in DMDLModulesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLModulesIndexView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}