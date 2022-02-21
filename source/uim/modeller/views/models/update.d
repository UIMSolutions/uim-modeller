module uim.modeller.views.models.update;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLModelsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Modell bearbeiten"));
      
    this.form
      .action("/modeller/models/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Modelle")
      .subTitle("Modell anzeigen");
      
    this.form.formBody(
      MDLEntityClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsUpdateView~"::DMDLModelsUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modell ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modell Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModelsUpdateView"));