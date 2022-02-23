module uim.modeller.views.attributes.create;

@safe:
import uim.modeller;
import uim.modeller.views.attributes;

class DMDLAttributesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLAttributesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attribute")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleCreate("Attribut erstellen"));

    this.form
      .action("/modeller/attributes/actions/create")
      .parameter("rootPath", myRootPath);
    
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
    debugMethodCall(moduleName!DMDLAttributesCreateView~"::DMDLAttributesCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLAttributesCreateView"));
