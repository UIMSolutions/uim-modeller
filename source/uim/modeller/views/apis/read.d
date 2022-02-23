module uim.modeller.views.apis.read;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLApisReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Apis")
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
      .parameter("mainTitle", "Apis")
      .parameter("subTitle", "Apis anzeigen");

    this.form.body_(
      MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisReadView~"::DMDLApisReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLApisReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}