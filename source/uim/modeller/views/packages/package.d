module uim.modeller.views.packages;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.packages.index;

// CRUD Modules
public import uim.modeller.views.packages.create;
public import uim.modeller.views.packages.read;
public import uim.modeller.views.packages.update;
public import uim.modeller.views.packages.delete_;

package:
  string myRootPath = "/modeller/packages";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Packages", "Packages");
