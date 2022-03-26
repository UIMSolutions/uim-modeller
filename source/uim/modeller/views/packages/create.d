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
      .link(["href":this.rootPath], "Package")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Attribut erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/packages/actions/create")
      .rootPath(this.rootPath);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Package")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }
    
    this
      .form
        .content(
            MDLPackageFormContent
              .fields(["name", "display", "description", "packages", "text"])); 
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

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLPackagesCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLPackagesCreateView); 
}}
