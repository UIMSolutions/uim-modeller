module uim.modeller.views.packages.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.packages;

class DMDLPackagesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLPackagesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Packages")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/packages/actions/delete")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Packages")
      .subTitle("Packages löschen");
    
    this
      .form
        .formBody(
          MDLPackageFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesDeleteView~"::DMDLPackagesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Package ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Package Name:";

    this
      .form.action("/modeller/packages/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLPackagesDeleteView"));