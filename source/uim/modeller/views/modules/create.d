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

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleCreate("Modul erstellen"));

    this.form
      .action("/modeller/modules/actions/create")
      .parameter("rootPath", myRootPath);
    
    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Neues Modul")
      .parameter("subTitle", "Bitte Werte eingeben");
    
    if (auto formHeader = cast(DFormHeader)this.form.header) {
      formHeader.actions([["cancel", "save"]]);
    }
    
    this
      .form
        .body_(
            MDLModuleFormContent(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModulesCreateView~"::DMDLModulesCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
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
