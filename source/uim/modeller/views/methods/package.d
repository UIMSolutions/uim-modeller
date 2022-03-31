module uim.modeller.views.methods;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.methods.index;

// CRUD Modules
public import uim.modeller.views.methods.create;
public import uim.modeller.views.methods.read;
public import uim.modeller.views.methods.update;

package:
  string myRootPath = "/modeller/methods";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Methods", "Methods");
