module uim.modeller.views.attributes.read;

@safe:
import uim.modeller;
import uim.modeller.views.attributes;

class DMDLAttributesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLAttributesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attributes")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(
        titleView("Blog anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Attributes")
      .subTitle("Attributes anzeigen");

    this.form.body_(
      MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesReadView~"::DMDLAttributesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLAttributesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}