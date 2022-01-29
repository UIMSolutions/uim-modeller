module uim.modeller.views.attributeclasses.index;

@safe:
import uim.modeller;
import uim.modeller.views.attributeclasses;

class DMDLAttributeClassesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLAttributeClassesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attributeclasses")
    );

    auto headerTitle = titleList("Attributeclasses");
    auto bodyTitle = "Gefundene Attributeclasses";

    this
      .pageHeader(APPPageHeader(this).breadcrumbs(bc).rootPath(myRootPath).title(titleView("Übersicht Attributeclasses")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).rootPath(myRootPath).mainTitle("Attributeclasses").subTitle("Attributeclasses anzeigen").actions([["print", "export"]]))
        .formBody(APPListFormBody(this.form).rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.formHeader(APPFormHeader.rootPath("/attributeclasses").mainTitle("Attributeclasses").subTitle("Übersicht Attributeclasses").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DMDLAttributeClassesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLAttributeClassesIndexView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}