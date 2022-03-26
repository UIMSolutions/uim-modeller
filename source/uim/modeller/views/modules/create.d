module uim.modeller.views.modules.create;

@safe:
import uim.modeller;
import uim.modeller.views.modules;

class DMDLModulesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLModulesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/modules"], "Module")
      .link(["active"], ["href":"/modeller/modules/create"], "Erstellen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Modul erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/modules/actions/create")
        .rootPath(this.rootPath)
        .content(
            MDLModuleFormContent); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Modul")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesCreateView~"::DMDLModulesCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       // .headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLModulesCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModulesCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModulesCreateView); 
}}
