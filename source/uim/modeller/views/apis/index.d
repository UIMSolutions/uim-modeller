module uim.modeller.views.apis.index;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLApisIndexView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/apis");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Apis")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(bc)
        .rootPath(this.rootPath)
        .title(titleView("Übersicht Apis"))
        .actions([["refresh", "list", "create"]]);
    }


    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)      
        .content(
          EntitiesFormContent(frm)
            .rootPath(this.rootPath))
        .header(
          FormHeader(frm)
            .rootPath(this.rootPath)
            .mainTitle("Apis")
            .subTitle("Apis anzeigen")
            .actions([["print", "export"]]));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisIndexView~":DMDLApisIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/apis")
            .mainTitle("Apis")
            .subTitle("Übersicht Apis")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisIndexView~":DMDLApisIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = this.rootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLApisIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLApisIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLApisIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLApisIndexView); 
}}