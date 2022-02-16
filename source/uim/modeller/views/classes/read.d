module uim.modeller.views.classes.read;

@safe:
import uim.modeller;
import uim.modeller.views.classes;

class DMDLClassesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLClassesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Classes")
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
      .mainTitle("Classes")
      .subTitle("Classes anzeigen");

    this.form.formBody(
      MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLClassesReadView~"::DMDLClassesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLClassesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}