module uim.modeller.scripts.links.edit;

@safe:
import uim.modeller;
import uim.modeller.scripts.links;

public:
auto editEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~      
    jsElementById(["entity_theme"])~
    jsEditEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/edit.js", "w"); // open for writing
  f.write(editEntity);
}
