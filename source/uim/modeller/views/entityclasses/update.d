module uim.modeller.views.entityclasses.update;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLEntityClassesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätenklassen")
      .link(["active"], ["href":"/modeller/entityclasses/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Entitätenklasse bearbeiten"));
      
    this.form
      .action("/modeller/entityclasses/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Entitätenklassen")
      .subTitle("Entitätenklasse bearbeiten");
      
    this.form.formBody(
      MDLEntityClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdateView~"::DMDLEntityClassesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Entitätenklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Entitätenklasse Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesUpdateView"));