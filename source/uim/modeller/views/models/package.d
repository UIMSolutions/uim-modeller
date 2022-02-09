module uim.modeller.views.models;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.models.index;

// CRUD Modules
public import uim.modeller.views.models.create;
public import uim.modeller.views.models.read;
public import uim.modeller.views.models.update;
public import uim.modeller.views.models.delete_;

package:
  string myRootPath = "/modeller/models";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Models", "Models");
