module uim.modeller.views.apis;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.apis.index;

// CRUD Modules
public import uim.modeller.views.apis.read;
public import uim.modeller.views.apis.update;
public import uim.modeller.views.apis.delete_;

package:
  string myRootPath = "/modeller/apis";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Apis", "Apis");
