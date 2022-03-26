module uim.modeller.views.models.index;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLModelsIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":"/modeller/models"], "Modelle")
    );

    auto headerTitle = titleList("Modelle");
    auto bodyTitle = "Gefundene Modelle";

    this
      .header(
        APPPageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Models")).actions(["refresh", "list", "create"]))
      .form(APPEntitiesListForm(this).rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) {
      frm
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath))
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Modelle")
            .subTitle("Modelle anzeigen")
            .actions([["print", "export"]]));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsIndexView~":DMDLModelsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) { 
      frm.header(
        FormHeader
          .rootPath("/models")
          .mainTitle("Modelle")
          .subTitle("Übersicht Modelle")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsIndexView~":DMDLModelsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLModelsIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLModelsIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModelsIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModelsIndexView); 
}}