module uim.modeller.views.modules;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.modules.index;

// CRUD Modules
public import uim.modeller.views.modules.update;

package:
  string myRootPath = "/modeller/modules";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Modules", "Modules");
