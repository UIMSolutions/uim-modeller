module uim.modeller.views.modules;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.modules.index;

// CRUD Modules
public import uim.modeller.views.modules.create;
public import uim.modeller.views.modules.read;
public import uim.modeller.views.modules.update;
public import uim.modeller.views.modules.delete_;

package:
  string myRootPath = "/modeller/modules";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Modules", "Modules");
