module uim.modeller.views.models.read;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLModelsReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/read"], "Anzeigen")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleView("Modell anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Modelle")
      .subTitle("Modell anzeigen");

    this.form.formBody(
      MDLEntityClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsReadView~"::DMDLModelsReadView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modell ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modell Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModelsReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}