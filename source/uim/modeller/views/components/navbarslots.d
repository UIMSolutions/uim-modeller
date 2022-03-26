module uim.modeller.views.components.navbarslots;

@safe:
import uim.modeller;

class DMDLNavSlot : DAPPNavbarSlot {
  mixin(ViewComponentThis!("MDLNavSlot"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto rootPath = options.get("rootPath", "/");

    return
      [BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("MDL")),
        BS5DropdownMenu
        .link((options.get("serverMdlOverview", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller"], "Übersicht")
        .divider
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/apis"], "Apis")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/apps"], "Apps")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/attributes"], "Attributes")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/attributeclasses"], "AttributeClasses")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/libraries"], "Bibliotheken")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/functions"], "Funktionen")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/interfaces"], "Interfaces")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/entityclasses"], "EntityClasses")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/models"], "Models")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/modules"], "Module")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/methods"], "Methoden")
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/packages"], "Packages")
      )].toH5;
  }
}
mixin(ViewComponentCalls!("MDLNavSlot"));

class DBSIStructure : DAPPNavbarSlot {
  this() { super(); }

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto rootPath = options.get("rootPath", "/");

    return
      [BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("Struktur")),
        BS5DropdownMenu
        .link((options.get("serverMdlOverview", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure"], "Übersicht")
        .divider
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/informations"], "Informationen")
        .link((options.get("serverMdlBlogs", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/processes"], "Prozesse")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/applications"], "Applikationen")
        .link((options.get("serverMdlPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/itsystems"], "IT-Systeme")
        .link((options.get("serverMdlPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/networks"], "Netzwerke")
        .link((options.get("serverMdlPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/rooms"], "Räume")
        .link((options.get("serverMdlPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/buildings"], "Gebäude")
      )].toH5;
  }
}
auto BSIStructure() { return new DBSIStructure; }