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
      .link(["href":this.rootPath], "Packages")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Blog löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/packages/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLPackageFormContent
            .fields(["name", "display", "description", "packages", "text"])); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Packages")
          .subTitle("Packages löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesDeleteView~"::DMDLPackagesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Package ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Package Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/packages/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
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