module uim.modeller.views.entityclasses.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLEntityClassesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätenklassen")
      .link(["active"], ["href":"/modeller/entityclasses/delete"], "Löschen")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleDelete("Entitätenklasse löschen"));

    this.form
      .action("/modeller/entityclasses/actions/delete")
      .parameter("rootPath", myRootPath);
    
    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Entitätenklassen")
      .parameter("subTitle", "Entitätenklasse löschen");
    
    this.form.body_(
      MDLEntityClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesDeleteView~"::DMDLEntityClassesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .action("/modeller/entityclasses/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesDeleteView"));