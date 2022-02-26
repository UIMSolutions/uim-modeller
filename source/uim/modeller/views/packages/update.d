module uim.modeller.views.packages.update;

@safe:
import uim.modeller;
import uim.modeller.views.packages;

class DMDLPackagesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLPackagesUpdateView"));

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
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/packages/actions/save")
      .crudMode(CRUDModes.Update)
      .parameter("rootPath", myRootPath);

    if (this.form) {
      this.form.header
        .parameter("rootPath", myRootPath)
        .parameter("mainTitle", "Packages")
        .parameter("subTitle", "Packages anzeigen");
        
      this.form.body_(
        MDLPackageFormBody(this.form)
          .fields(["name", "display", "description", "packages", "text"])); 
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesUpdateView~"::DMDLPackagesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLPackagesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLPackagesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLPackagesUpdateView); 
}}