module uim.modeller.views.packages.create;

@safe:
import uim.modeller;
import uim.modeller.views.packages;

class DMDLPackagesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLPackagesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Package")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Attribut erstellen"));

    this.form
      .action("/modeller/packages/actions/create")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Neues Package")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this
      .form
        .body_(
            MDLPackageFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesCreateView~"::DMDLPackagesCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLPackagesCreateView"));
