module uim.modeller.views.classes;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.classes.index;

// CRUD Modules
public import uim.modeller.views.classes.create;
public import uim.modeller.views.classes.read;
public import uim.modeller.views.classes.update;
public import uim.modeller.views.classes.delete_;

package:
  string myRootPath = "/modeller/classes";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Classes", "Classes");
