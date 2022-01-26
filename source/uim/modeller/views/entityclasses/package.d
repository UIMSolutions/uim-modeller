module uim.modeller.views.entityclasses;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.entityclasses.index;

// CRUD Modules
public import uim.modeller.views.entityclasses.create;
public import uim.modeller.views.entityclasses.read;
public import uim.modeller.views.entityclasses.update;
public import uim.modeller.views.entityclasses.delete_;

package:
  string myRootPath = "/cms/entityclasses";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Entityclasses", "Entityclasses");
