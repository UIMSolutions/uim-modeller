module uim.modeller.views.components.navbarslots;

@safe:
import uim.modeller;

class DMDLNavSlot : DAPPNavbarSlot {
  this() { super(); }

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto rootPath = options.get("rootPath", "/");

    return
      [BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("MDL")),
        BS5DropdownMenu
        .link((options.get("serverMdlOverview", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller"], "Übersicht")
        .divider
        .link((options.get("serverMdlThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/models"], "Models")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/entityclasses"], "EntityClasses")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/attributeclasses"], "AttributeClasses")
        .link((options.get("serverMdlNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/modeller/attributes"], "Attributes")
      )].toH5;
  }
}
auto MDLNavSlot() { return new DMDLNavSlot; }

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