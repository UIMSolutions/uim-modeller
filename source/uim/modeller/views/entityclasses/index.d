module uim.modeller.views.entityclasses.index;

@safe:
import uim.modeller;

class DMDLEntityClassesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLEntityClassesIndexView"));

  override void initialize() {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::beforeResponse");
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");
      
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":this.rootPath], "Entitätsklassen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(bc)
        .rootPath(this.rootPath)
        .title(titleView("Übersicht Entitätsklassen"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)      
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Entityclasses")
            .subTitle("Entityclasses anzeigen")
            .actions([["print", "export"]]))
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln("In ", __MODULE__, "/", __LINE__);
    debug writeln("In ", __MODULE__, "/rootPath = ", this.rootPath);
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesIndexView~":DMDLEntityClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = this.rootPath;

    this.rootPath(this.rootPath);
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
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesIndexView); 
}}