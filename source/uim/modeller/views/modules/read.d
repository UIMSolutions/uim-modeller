module uim.modeller.views.modules.read;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLModulesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Modules")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(
        titleView("Blog anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Modules")
      .subTitle("Modules anzeigen");

    this.form.formBody(
      MDLModuleFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesReadView~"::DMDLModulesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLModulesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}