module uim.modeller.scripts.docus.edit;

@safe:
import uim.modeller;
import uim.modeller.scripts.docus;

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
