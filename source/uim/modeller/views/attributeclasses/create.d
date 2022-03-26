module uim.modeller.views.attributeclasses.create;

@safe:
import uim.modeller;
import uim.modeller.views.attributeclasses;

class DMDLAttributeClassesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLAttributeClassesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/attributeclasses"], "Attributklassen")
      .link(["active"], ["href":"/modeller/attributeclasses/create"], "Erstellen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Attributklasse erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/attributeclasses/actions/create")
        .rootPath(this.rootPath)
        .content(
          MDLAttributeClassFormContent); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neue Attributklasse")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesCreateView~"::DMDLAttributeClassesCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

  }
}
mixin(APPViewCalls!("MDLAttributeClassesCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributeClassesCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributeClassesCreateView); 
}}
