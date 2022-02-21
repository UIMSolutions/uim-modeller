module uim.modeller.views.entityclasses.create;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLEntityClassesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätenklassen")
      .link(["active"], ["href":"/modeller/entityclasses/create"], "Erstellen")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Entitätenklasse erstellen"));

    this.form
      .action(myRootPath~"/actions/create")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Neue Entitätenklasse")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this.form.formBody(
      MDLEntityClassFormBody(this.form)
      .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesCreateView~"::DMDLEntityClassesCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    this.form
      .action("/modeller/entityclasses/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesCreateView"));
