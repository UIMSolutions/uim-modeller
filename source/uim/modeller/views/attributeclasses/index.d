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
      .link(["href":myRootPath], "Attributklassen")
    );

    auto headerTitle = titleList("Attributklassen");
    auto bodyTitle = "Gefundene Attributklassen";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).parameter("rootPath", myRootPath).parameter("title", titleView("Übersicht Attributeclasses")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).parameter("rootPath", myRootPath));

    if (this.form) {
      this.form.header(
        APPEntitiesFormHeader(this.form)
          .parameter("rootPath", myRootPath)
          .parameter("mainTitle", "Attributklassen")
          .parameter("subTitle", "Attributklassen anzeigen")
          .actions([["print", "export"]]));
      
      this.form.body_(
          APPEntitiesFormBody(this.form)
            .parameter("rootPath", myRootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    this.form.header(APPFormHeader.rootPath("/attributeclasses").parameter("mainTitle", "Attributklassen").parameter("subTitle", "Übersicht Attributklassen").actions([["refresh"],["create"]]));
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.parameter("rootPath", myRootPath);
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
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributeClassesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributeClassesIndexView); 
}}