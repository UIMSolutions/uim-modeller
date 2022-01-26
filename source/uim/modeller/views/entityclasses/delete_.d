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
      .link(["href":"/modeller"], "MDL")
      .link(["href":myRootPath], "Entityclasses")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/cms/entityclasses/actions/delete")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Entityclasses")
      .subTitle("Entityclasses löschen");
    
    this.form.formBody(
      MDLPostFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesDeleteView~"::DMDLEntityClassesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .action("/cms/entityclasses/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesDeleteView"));