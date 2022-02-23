module uim.modeller.views.packages.read;

@safe:
import uim.modeller;
import uim.modeller.views.packages;

class DMDLPackagesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLPackagesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Packages")
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
      .parameter("mainTitle", "Packages")
      .parameter("subTitle", "Packages anzeigen");

    this.form.body_(
      MDLPackageFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesReadView~"::DMDLPackagesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLPackagesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}