module uim.modeller.views.modules.index;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("MDLModulesIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["active"], ["href":"/modeller/modules"], "Module")
    );

    auto headerTitle = titleList("Module");
    auto bodyTitle = "Gefundene Module";

    this
      .header(
        APPPageHeader(this)
          .breadcrumbs(bc)
          .rootPath(this.rootPath)
          .title(titleView("Übersicht Modules"))
          .actions([["refresh", "list", "create"]]))
      .form(
        APPEntitiesListForm(this)
          .rootPath(this.rootPath));

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath(this.rootPath)
            .mainTitle("Module")
            .subTitle("Module anzeigen")
            .actions([["print", "export"]]))
        .content(
          EntitiesFormContent
            .rootPath(this.rootPath));
    }        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesIndexView~":DMDLModulesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm.header(
        FormHeader
          .rootPath("/modules")
          .mainTitle("Module")
          .subTitle("Übersicht Module")
          .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesIndexView~":DMDLModulesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(this.rootPath);
    debug writeln("RootPath in DMDLModulesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("MDLModulesIndexView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModulesIndexView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModulesIndexView); 
}}

/*         APPListViewComponent
          .showFilter(true)
          .showHeader(true)
          .showNumber(true)
          .showSorter(true)
          .filterValues(["className": "KlassenName", "display": "Titel"])
          .sortValues(["className": "KlassenName", "display": "Titel"])
          .itemTemplate(
            UIMModuleListItem
              .rootPath("/projects/module/"))) */