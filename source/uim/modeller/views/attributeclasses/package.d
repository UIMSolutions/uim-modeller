module uim.modeller.views.attributeclasses;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.attributeclasses.index;

// CRUD Modules
public import uim.modeller.views.attributeclasses.read;
public import uim.modeller.views.attributeclasses.update;
public import uim.modeller.views.attributeclasses.delete_;

package:
  string myRootPath = "/modeller/attributeclasses";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Attributeclasses", "Attributeclasses");
