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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Modul bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/modules/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(
          MDLModuleFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Module")
          .subTitle("Modul anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesUpdateView~"::DMDLModulesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modul ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modul Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
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