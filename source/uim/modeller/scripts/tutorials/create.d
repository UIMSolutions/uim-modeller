module uim.modeller.scripts.tutorials.create;

@safe:
import uim.modeller;
import uim.modeller.scripts.tutorials;

auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entity_tutorial"])~
    "setTutorials();"~
    jsCreateEntity();

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
