module uim.modeller.views.libraries.index;

@safe:
import uim.modeller;
import uim.modeller.views.libraries;

class DMDLlibrariesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLlibrariesIndexView"));

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
      .pageHeader(APPPageHeader(this).breadcrumbs(bc).rootPath(myRootPath).title(titleView("Übersicht libraries")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).rootPath(myRootPath).mainTitle("libraries").subTitle("libraries anzeigen").actions([["print", "export"]]))
        .formBody(APPListFormBody(this.form).rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLlibrariesIndexView~":DMDLlibrariesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.formHeader(APPFormHeader.rootPath("/libraries").mainTitle("Libraryle").subTitle("Übersicht Libraryle").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLlibrariesIndexView~":DMDLlibrariesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DMDLlibrariesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLlibrariesIndexView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}