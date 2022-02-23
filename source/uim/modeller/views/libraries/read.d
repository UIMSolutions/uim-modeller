module uim.modeller.views.libraries.read;

@safe:
import uim.modeller;
import uim.modeller.views.libraries;

class DMDLLibrariesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLLibrariesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/libraries"], "Libraryle")
      .link(["active"], ["href":"/modeller/libraries/read"], "Anzeigen")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .parameter("title", titleView("Libraryl anzeigen"));
    
    this.form
      .parameter("rootPath", myRootPath);

    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Libraryle")
      .parameter("subTitle", "Libraryl anzeigen");

    this.form.body_(
      MDLLibraryFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesReadView~"::DMDLLibrariesReadView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Libraryl ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Libraryl Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLLibrariesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}