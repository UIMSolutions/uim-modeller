module uim.modeller.views.apps.create;

@safe:
import uim.modeller;
import uim.modeller.views.apps;

class DMDLAppsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLAppsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Attribute")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Attribut erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/apps/actions/create")
        .rootPath(this.rootPath);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Attribute")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }

    this
      .form
        .content(
            MDLAttributeFormContent); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsCreateView~"::DMDLAppsCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLAppsCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAppsCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAppsCreateView); 
}}
