module uim.modeller.views.methods.index;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLMethodsIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Methods")
    );

    auto headerTitle = titleList("Methods");
    auto bodyTitle = "Gefundene Methods";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).parameter("rootPath", myRootPath).parameter("title", titleView("Übersicht Methods")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).parameter("rootPath", myRootPath));
/*       .form
        .formHeader(APPEntitiesFormHeader(this.form).parameter("rootPath", myRootPath).parameter("mainTitle", "Methods").parameter("subTitle", "Methods anzeigen").actions([["print", "export"]]))
        .body_(APPListFormBody(this.form).parameter("rootPath", myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsIndexView~":DMDLMethodsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/methods").parameter("mainTitle", "Methods").parameter("subTitle", "Übersicht Methods").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsIndexView~":DMDLMethodsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
    debug writeln("RootPath in DMDLMethodsIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLMethodsIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLMethodsIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLMethodsIndexView); 
}}