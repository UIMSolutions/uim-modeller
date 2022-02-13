module uim.modeller.views.libraries;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.libraries.index;

// CRUD Modules
public import uim.modeller.views.libraries.create;
public import uim.modeller.views.libraries.read;
public import uim.modeller.views.libraries.update;
public import uim.modeller.views.libraries.delete_;

package:
  string myRootPath = "/modeller/libraries";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("libraries", "libraries");
