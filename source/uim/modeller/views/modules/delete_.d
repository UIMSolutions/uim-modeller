module uim.modeller.views.modules.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLModulesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/modules"], "Module")
      .link(["active"], ["href":"/modeller/modules/delete"], "Löschen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Modul löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/modules/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLModuleFormContent);     

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Module")
          .subTitle("Modul löschen");
      }
    }   
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesDeleteView~"::DMDLModulesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modul ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modul Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/modules/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLModulesDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModulesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModulesDeleteView); 
}}