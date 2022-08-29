module uim.modeller.views.pages.entities.delete_;

@safe:
import uim.modeller;

class DMDLEntityDeleteView : DMDLDeleteView {
  mixin(APPViewThis!("MDLEntityDeleteView"));
}
mixin(APPViewCalls!("MDLEntityDeleteView"));