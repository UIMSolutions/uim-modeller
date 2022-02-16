module uim.modeller.views.interfaces;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.interfaces.index;

// CRUD Modules
public import uim.modeller.views.interfaces.create;
public import uim.modeller.views.interfaces.read;
public import uim.modeller.views.interfaces.update;
public import uim.modeller.views.interfaces.delete_;

package:
  string myRootPath = "/modeller/interfaces";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Interfaces", "Interfaces");
