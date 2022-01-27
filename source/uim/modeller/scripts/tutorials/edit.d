module uim.modeller.scripts.tutorials.edit;

@safe:
import uim.modeller;
import uim.modeller.scripts.tutorials;

public:
auto editEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~      
    jsElementById(["entity_tutorial"])~
    jsEditEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/edit.js", "w"); // open for writing
  f.write(editEntity);
}
