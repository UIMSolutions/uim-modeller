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
      .link(["href":this.rootPath], "Attributes")
    );

    this
      .header(APPPageHeader(this).breadcrumbs(bc).rootPath(this.rootPath).title(titleView("Übersicht Attributes")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)      
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Attributes")
            .subTitle("Attributes anzeigen")
            .actions([["print", "export"]]))
          .content(
            EntitiesFormContent
              .rootPath(this.rootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesIndexView~":DMDLAttributesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/attributes")
          .mainTitle("Attributes")
          .subTitle("Übersicht Attributes")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesIndexView~":DMDLAttributesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
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