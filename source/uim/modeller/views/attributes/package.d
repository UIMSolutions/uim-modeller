module uim.modeller.views.attributes;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.attributes.index;

// CRUD Modules
public import uim.modeller.views.attributes.read;
public import uim.modeller.views.attributes.update;

package:
  string myRootPath = "/modeller/attributes";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Attributes", "Attributes");
