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
      .link(["href":this.rootPath], "Attributklassen")
    );

    auto headerTitle = titleList("Attributklassen");
    auto bodyTitle = "Gefundene Attributklassen";

    this
      .header(PageHeader(this).breadcrumbs(bc).rootPath(this.rootPath).title(titleView("Übersicht Attributeclasses")).actions([["refresh", "list", "create"]]))
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)      
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Attributklassen")
            .subTitle("Attributklassen anzeigen")
            .actions([["print", "export"]]))
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

     if (auto frm  = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/attributeclasses")
          .mainTitle("Attributklassen")
          .subTitle("Übersicht Attributklassen")
          .actions([["refresh"],["create"]]));
     }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesIndexView~":DMDLAttributeClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
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