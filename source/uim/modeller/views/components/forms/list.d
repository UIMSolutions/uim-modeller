module uim.modeller.views.components.forms.list;

@safe:
import uim.modeller; 

class DMDLListFormBodyx : DAPPListFormBody {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }

  mixin(SProperty!("string", "entitiesName"));

  override DH5Obj[] toH5(STRINGAA reqParameters) {
    string rows; 
//    foreach(entity;entities) {

    return [
      BS5Card
      .header(H5H3(["card-title"], "Gefundene "~entitiesName))
      .body_(["border-bottom py-3"], 
        H5Div(["d-flex"],
          viewEntities(10), 
          // searchInList(entitiesName)              
          )
        )
      (
        H5Div(["table-responsive"],
          BS5Table(["card-table table-vcenter text-nowrap datatable table table-hover"])
          .header(
            /* columns,
            filters */
            )
          .body_("tableBody", rows)
        )
      )].toH5;
/*       .footer(["d-flex align-items-center"], 
      H5P("availableEntites",["m-0 text-muted"], "Anzeige <span>1</span> bis <span>8</span> von <span>18</span> Einträgen"),
      H5Ul("pagesEntites", ["m-0 ms-auto pagination"], linkPrev("prevEntities"))
      .li(["page-item active"], H5A("pageDisplay", ["page-link"], "1"))
      (linkNext("nextEntities"))); 
 */  
  }
}
/* auto MDLListFormBody() { return new DMDLListFormBody; }
auto MDLListFormBody(DAPPForm myForm) { return new DMDLListFormBody(myForm); } */
