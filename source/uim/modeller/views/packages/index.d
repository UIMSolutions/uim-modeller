module uim.modeller.views.packages.index;

@safe:
import uim.modeller;
import uim.modeller.views.packages;

class DMDLPackagesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLPackagesIndexView"));

  override void initialize() {
    debugMethodCall(moduleName!DMDLPackagesIndexView~":DMDLPackagesIndexView("~this.name~")::beforeResponse");
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Packages")
    );

    this
      .rootPath("/modeller/packages")
      .header(
        APPPageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Packages"))
          .actions(["refresh", "list", "create"]))
      .form(
        APPEntitiesListForm(this)
        .rootPath(this.rootPath)
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Packages")
            .subTitle("Packages anzeigen")
            .actions([["print", "export"]]))
        .content(
          APPListFormContent
            .rootPath(this.rootPath)));
        
/*     if (this.form) {
      this.form.content(
          EntitiesFormContent
            .rootPath(this.rootPath));

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader(
        FormHeader
          .rootPath(this.rootPath)
          .mainTitle("Packages")
          .subTitle("Packages anzeigen")
          .actions([["print", "export"]]));
      }      
    }  */  
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesIndexView~":DMDLPackagesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm.header(
        FormHeader
          .rootPath("/packages")
          .mainTitle("Packages")
          .subTitle("Übersicht Packages")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesIndexView~":DMDLPackagesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLPackagesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLPackagesIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLPackagesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLPackagesIndexView); 
}}