module uim.modeller.scripts.app;

@safe:
import uim.modeller;
import uim.modeller.scripts.blogs;

auto cmsapp() {  
  return "";
}

unittest {
  auto f = File("../../PUBLIC/js/apps/cms/app.js", "w"); // open for writing
  f.write(cmsapp);
}