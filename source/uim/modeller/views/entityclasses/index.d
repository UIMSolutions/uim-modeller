module uim.modeller.views.entityclasses.index;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLEntityClassesIndexView"));

  override void initialize() {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::beforeResponse");
    super.initialize;

    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::back");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":myRootPath], "Entitätsklassen")
    );

    auto headerTitle = titleList("Entitätsklassen");
    auto bodyTitle = "Gefundene Entitätsklassen";

    this
      .header(
        APPPageHeader(this)
          .breadcrumbs(bc)
          .parameter("rootPath", myRootPath)
          .parameter("title", titleView("Übersicht Entitätsklassen"))
          .actions(["refresh", "list", "create"]))
      .form(
          APPEntitiesListForm(this)
          .parameter("rootPath", myRootPath))
      .form
        .header(
          APPEntitiesFormHeader(this.form)
            .parameter("rootPath", myRootPath)
            .parameter("mainTitle", "Entityclasses")
            .parameter("subTitle", "Entityclasses anzeigen")
            .actions([["print", "export"]]))
        .body_(
            APPListFormBody(this.form)
              .parameter("rootPath", myRootPath));
        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this.form.header(APPFormHeader.rootPath("/entityclasses").parameter("mainTitle", "Entitätsklassen").parameter("subTitle", "Übersicht Entitätsklassen").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
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