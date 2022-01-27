module uim.modeller.scripts.offers.edit;

@safe:
import uim.modeller;
import uim.modeller.scripts.offers;

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
