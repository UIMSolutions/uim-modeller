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
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätsklassen")
      .link(["active"], ["href":"/modeller/entityclasses/read"], "Anzeigen")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleView("Entitätsklasse anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Entitätenklassen")
      .subTitle("Entitätenklasse anzeigen");

    this.form.formBody(
      MDLEntityClassFormBody(this.form).crudMode(CRUDModes.Read));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesReadView~"::DMDLEntityClassesReadView:beforeH5");
    super.beforeH5(options);

    this.form
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}