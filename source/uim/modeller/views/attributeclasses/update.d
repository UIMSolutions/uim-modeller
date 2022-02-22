module uim.modeller.views.attributeclasses.update;

@safe:
import uim.modeller;
import uim.modeller.views.attributeclasses;

class DMDLAttributeClassesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLAttributeClassesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/attributeclasses"], "Attributklassen")
      .link(["active"], ["href":"/modeller/attributeclasses/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/attributeclasses/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Attributklassen")
      .subTitle("Attributklasse anzeigen");
      
    this.form.body_(
      MDLAttributeClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesUpdateView~"::DMDLAttributeClassesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attributklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attributklasse Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLAttributeClassesUpdateView"));