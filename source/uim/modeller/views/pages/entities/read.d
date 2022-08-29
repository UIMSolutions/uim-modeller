module uim.modeller.views.pages.entities.read;

@safe:
import uim.modeller;

class DMDLEntityReadView : DMDLReadView {
  mixin(APPViewThis!("MDLEntityReadView"));
}
mixin(APPViewCalls!("MDLEntityReadView"));