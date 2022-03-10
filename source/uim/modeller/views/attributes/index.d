module uim.modeller.views.attributes.index;

@safe:
import uim.modeller;
import uim.modeller.views.attributes;

class DMDLAttributesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLAttributesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attributes")
    );

    auto headerTitle = titleList("Attributes");
    auto bodyTitle = "Gefundene Attributes";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).parameter("rootPath", myRootPath).parameter("title", titleView("Übersicht Attributes")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).parameter("rootPath", myRootPath));

    if (this.form) {
      this.form
        .rootPath(this.rootPath)      
        .header(
          APPEntitiesFormHeader(this.form)
            .parameter("rootPath", myRootPath)
            .parameter("mainTitle", "Attributes")
            .parameter("subTitle", "Attributes anzeigen")
            .actions([["print", "export"]]))
          .body_(
            APPEntitiesFormBody(this.form)
              .parameter("rootPath", myRootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesIndexView~":DMDLAttributesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/attributes").parameter("mainTitle", "Attributes").parameter("subTitle", "Übersicht Attributes").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesIndexView~":DMDLAttributesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
    debug writeln("RootPath in DMDLAttributesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLAttributesIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributesIndexView); 
}}