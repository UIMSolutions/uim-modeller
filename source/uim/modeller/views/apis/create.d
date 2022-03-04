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

    this.header
      .parameter("rootPath", this.rootPath)
      .parameter("title", titleCreate("Attribut erstellen"))
      .breadcrumbs(bc);

    this.form
      .parameter("rootPath", this.rootPath)
      .action("/modeller/apis/actions/create");
    
    this.form.header
      .parameter("rootPath", this.rootPath)
      .parameter("mainTitle", "Neues Attribute")
      .parameter("subTitle", "Bitte Werte eingeben");

    if (auto formHeader = cast(DAPPFormHeader)this.form.header) {
      formHeader.actions([["cancel", "save"]]);
    }

    this
      .form
        .body_(
            MDLAttributeFormBody(this.form)); 
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
