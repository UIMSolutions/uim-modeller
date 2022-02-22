module uim.modeller.views.methods.create;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLMethodsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Method")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Attribut erstellen"));

    this.form
      .action("/modeller/methods/actions/create")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Neues Method")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this
      .form
        .body_(
            MDLMethodFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsCreateView~"::DMDLMethodsCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLMethodsCreateView"));
