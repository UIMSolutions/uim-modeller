module uim.modeller.scripts.app;

@safe:
import uim.modeller;
import uim.modeller.scripts.blogs;

auto mdlapp() {  
  return "";
}

unittest {
  auto f = File("../../PUBLIC/js/apps/mdl/app.js", "w"); // open for writing
  f.write(mdlapp);
}