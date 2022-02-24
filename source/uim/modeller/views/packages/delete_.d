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

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/packages/actions/delete")
      .parameter("rootPath", myRootPath);
    
    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Packages")
      .parameter("subTitle", "Packages löschen");
    
    this
      .form
        .body_(
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

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLPackagesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLPackagesDeleteView); 
}}