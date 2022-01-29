module uim.modeller.views.entityclasses.index;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLEntityClassesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Entityclasses")
    );

    auto headerTitle = titleList("Entityclasses");
    auto bodyTitle = "Gefundene Entityclasses";

    this
      .pageHeader(APPPageHeader(this).breadcrumbs(bc).rootPath(myRootPath).title(titleView("Übersicht Entityclasses")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).rootPath(myRootPath).mainTitle("Entityclasses").subTitle("Entityclasses anzeigen").actions([["print", "export"]]))
        .formBody(APPListFormBody(this.form).rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.formHeader(APPFormHeader.rootPath("/entityclasses").mainTitle("Entityclasses").subTitle("Übersicht Entityclasses").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DMDLEntityClassesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLEntityClassesIndexView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}