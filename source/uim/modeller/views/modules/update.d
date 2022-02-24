module uim.modeller.views.modules.update;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLModulesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/modules"], "Module")
      .link(["active"], ["href":"/modeller/modules/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleEdit("Modul bearbeiten"));
      
    this.form
      .action("/modeller/modules/actions/save")
      .crudMode(CRUDModes.Update)
      .parameter("rootPath", myRootPath);

    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Module")
      .parameter("subTitle", "Modul anzeigen");
      
    this.form.body_(
      MDLModuleFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesUpdateView~"::DMDLModulesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modul ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modul Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModulesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModulesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModulesUpdateView); 
}}