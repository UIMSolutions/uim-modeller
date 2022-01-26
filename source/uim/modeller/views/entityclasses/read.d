module uim.modeller.views.entityclasses.read;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLEntityClassesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/modeller"], "MDL")
      .link(["href":myRootPath], "Entityclasses")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleView("Blog anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Entityclasses")
      .subTitle("Entityclasses anzeigen");

    this.form.formBody(
      MDLPostFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesReadView~"::DMDLEntityClassesReadView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesReadView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}