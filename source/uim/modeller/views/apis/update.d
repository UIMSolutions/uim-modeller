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

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", this.rootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/apis/actions/save")
      .crudMode(CRUDModes.Update)
      .parameter("rootPath", this.rootPath);

    this.form.header
      .parameter("rootPath", this.rootPath)
      .parameter("mainTitle", "Apis")
      .parameter("subTitle", "Apis anzeigen");
      
    this.form.body_(
      MDLAttributeFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisUpdateView~"::DMDLApisUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
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