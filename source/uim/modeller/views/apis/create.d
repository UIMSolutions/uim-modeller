module uim.modeller.views.apis.create;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLApisCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DMDLApisCreateView~"::DMDLApisCreateView("~this.name~"):initialize");   
    super.initialize;
    
    this
      .rootPath("/modeller/apis");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Attribute")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Attribut erstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)
        .action("/modeller/apis/actions/create")
        .content(MDLAttributeFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .rootPath(this.rootPath)
            .mainTitle("Neues Attribute")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisCreateView~"::DMDLApisCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = this.rootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLApisCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLApisCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLApisCreateView); 
}}
