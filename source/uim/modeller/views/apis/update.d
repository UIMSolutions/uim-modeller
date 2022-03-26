module uim.modeller.views.apis.update;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLApisUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/apis");
      
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Apis")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Blog bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/apis/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(
          MDLAttributeFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Apis")
          .subTitle("Apis anzeigen");
      }
    } 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisUpdateView~"::DMDLApisUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLApisUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLApisUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLApisUpdateView); 
}}