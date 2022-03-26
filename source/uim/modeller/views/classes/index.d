module uim.modeller.views.classes.index;

@safe:
import uim.modeller;
import uim.modeller.views.classes;

class DMDLClassesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLClassesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Classes")
    );

    auto headerTitle = titleList("Classes");
    auto bodyTitle = "Gefundene Classes";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Classes"))
          .actions([["refresh", "list", "create"]]))          
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));
/*       .form
        .formHeader(FormHeader.rootPath(this.rootPath).mainTitle("Classes").subTitle("Classes anzeigen").actions([["print", "export"]]))
        .content(APPListFormContent.rootPath(this.rootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLClassesIndexView~":DMDLClassesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
        frm.header(
          FormHeader
            .rootPath("/classes")
            .mainTitle("Classes")
            .subTitle("Übersicht Classes")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLClassesIndexView~":DMDLClassesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLClassesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLClassesIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLClassesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLClassesIndexView); 
}}
