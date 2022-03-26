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
      .link(["href":this.rootPath], "Methoden")
    );

    auto headerTitle = titleList("Methoden");
    auto bodyTitle = "Gefundene Methoden";

    this
      .header(APPPageHeader(this).breadcrumbs(bc).rootPath(this.rootPath).title(titleView("Übersicht Methods")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) { 
      frm
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath));
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Methoden")
            .subTitle("Methoden anzeigen")
            .actions([["print", "export"]]));     
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsIndexView~":DMDLMethodsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/methods")
          .mainTitle("Methods")
          .subTitle("Übersicht Methods")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsIndexView~":DMDLMethodsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
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