module uim.modeller.scripts.glossary.view;

@safe:
import uim.modeller;
import uim.modeller.scripts.glossary;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_theme"])~
    jsViewEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
  f.write(viewEntity);
}
