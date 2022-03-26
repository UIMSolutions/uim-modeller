module uim.modeller.views.components.listitems.function_;

@safe:
import uim.modeller;

class DMDLFunctionListItem : DEntityListItem {
  mixin(ViewComponentThis!("MDLFunctionListItem"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    
    auto link = this.rootPath~this.entity.name;

    return [
      BS5Row(
        BS5Col(["col-auto"], 
          H5A(["href":link], 
            H5Span(["avatar"], ["style":"background-image: url("~(entity["imagePath"].length > 0 ? entity["imagePath"] : "/img/projects/functions/function.jpg")~")"]))),
        BS5Col(["col", "text-truncate"], 
          H5A(["text-body", "d-block"], ["href":link], entity["display"]),
          H5Div(["text-muted text-truncate mt-n1"], entity["className"])),
        BS5Col(["col-auto pt-2"], 
          H5A(["list-group-item-actions show"], ["href":link], this.icon))
      )
    ].toH5;
  }
}
mixin(ViewComponentCalls!("MDLFunctionListItem"));
