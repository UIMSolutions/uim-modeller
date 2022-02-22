module uim.modeller.views.models.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLModelsDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/delete"], "Löschen")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Modell löschen"));

    this.form
      .action("/modeller/models/actions/delete")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Modelle")
      .subTitle("Modell löschen");
    
    this.form.body_(
      MDLModelFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsDeleteView~"::DMDLModelsDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Modell ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modell Name:";

    this.form
      .action("/modeller/models/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModelsDeleteView"));