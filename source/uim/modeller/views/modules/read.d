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
      .link(["href":"/modeller/modules"], "Module")
      .link(["active"], ["href":"/modeller/modules/read"], "Anzeigen")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(
        titleView("Blog anzeigen"));
    
    this.form
      .parameter("rootPath", myRootPath);

    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Module")
      .parameter("subTitle", "Modul anzeigen");

    this.form.body_(
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