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

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Attributklasse erstellen"));

    this.form
      .action("/modeller/attributeclasses/actions/create")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Neue Attributklasse")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this.form.body_(
      MDLAttributeClassFormBody(this.form)); 
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
