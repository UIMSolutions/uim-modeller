module uim.modeller.views.methods.read;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLMethodsReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Methods")
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
      .mainTitle("Methods")
      .subTitle("Methods anzeigen");

    this.form.formBody(
      MDLMethodFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsReadView~"::DMDLMethodsReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLMethodsReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}