module uim.modeller.layouts.layout;

@safe:
import uim.modeller;

class DMDLLayout : DAPPLayout {
  this() { super(); }

  override void initialize() {
    super.initialize();
    
    _bodyAttributes["style"] = "background-color: #ffffff;";

    this
    .title("UIM!MDL")   
    .parameters([
      "appLogo":"/img/servers/mdl/logo.png",
      "appTitle":"UIM!MDL"
      ]);

    this.metas.add( 
      ["charset":"utf-8"],
      ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
      ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
      ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
      );
    this.links.add(
      ["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
      );

    this.styles.addLinks(
      "/css/apps/app.css"
    );
//        ["href":"/css/uim.css", "rel":"stylesheet"],       
/*         ["href":"/css/apps/main.css", "rel":"stylesheet"],        
      ["href":"/css/apps/modeller/main.css", "rel":"stylesheet"]
*/  
      _bodyAttributes["style"] = "background-color: #ffffff;";
      _bodyClasses = ["d-flex", "flex-column", "h-100"];  

      this
      .navigation
        .secondNavbar
          .leftSlotsWithLogin([MDLNavSlot]);
  }

  override void renderBody(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLayout~"::DMDLLayout:renderBody");
    // super.renderBody(html, classes, attributes, content, options);
    
    auto nav = navigation ? navigation.render(options) : options.get("navigation", null);
    auto foot = footer ? footer.render(options) : options.get("footer", null);
    auto bodyContent = H5Div(["page"], ["style":"background-color:#ffffff;"], 
      nav~
      H5Div( 
        H5Main(["mt-3"], 
          content//~foot         
        )).toString
      ).toString;

    html
    .content(classes)
		.content(attributes)
		.content(bodyContent); 
  }
}
auto MDLLayout() { return new DMDLLayout; }

/* auto navigation(STRINGAA options = null) {
  auto rootPath = options.get("rootPath", "/");

  return 
    APPFirstNavbar.toString(options)~
    APPSecondNavbar([CTLNavSlot]).brand(["link":"/", "title":"ADMIN!Central"]).toString(options);
}    

string footer(STRINGAA  options = null) {
  auto rootPath = options.get("rootPath", "/");

  return H5Footer(["pt-3 pb-3 fixed-bottom"], ["style":"background-color:#35A6FF"], 
    BS5Container.fluid()(
      H5P(["m-0 text-center text-white"], 
        `Version 1.0.1 - Copyright &copy; 2017-2021 UI Manufaktur UG (haftungsbeschränkt) - License UIM`)
    )).toString;
}
 */