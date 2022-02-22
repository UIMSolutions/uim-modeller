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

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Modul löschen"));

    this.form
      .action("/modeller/modules/actions/delete")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Module")
      .subTitle("Modul löschen");
    
    this
      .form
        .body_(
          MDLModuleFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesDeleteView~"::DMDLModulesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Modul ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modul Name:";

    this
      .form.action("/modeller/modules/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModulesDeleteView"));