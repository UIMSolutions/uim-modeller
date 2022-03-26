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
      .link(["href":this.rootPath], "Interfaces")
    );

    auto headerTitle = titleList("Interfaces");
    auto bodyTitle = "Gefundene Interfaces";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Interfaces"))
          .actions([["refresh", "list", "create"]]))
      .form(
        APPEntitiesListForm(this)
        .rootPath(this.rootPath)           
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Interfaces")
            .subTitle("Interfaces anzeigen")
            .actions([["refresh"],["create"], ["print", "export"]]))
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath)));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesIndexView~":DMDLInterfacesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
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
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLInterfacesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLInterfacesIndexView); 
}}