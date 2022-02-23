module uim.modeller.views.apis.create;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLApisCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attribute")
    );

    this.header
      .parameter("rootPath", myRootPath)
      .parameter("title", titleCreate("Attribut erstellen"))
      .breadcrumbs(bc);

    this.form
      .parameter("rootPath", myRootPath)
      .action("/modeller/apis/actions/create");
    
    this.form.header
      .parameter("rootPath", myRootPath)
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
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLApisCreateView"));
