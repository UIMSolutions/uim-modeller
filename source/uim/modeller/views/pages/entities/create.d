module uim.modeller.views.pages.entities.create;

@safe:
import uim.modeller;

class DMDLEntityCreateView : DMDLCreateView {
  mixin(APPViewThis!("MDLEntityCreateView"));
}
mixin(APPViewCalls!("MDLEntityCreateView"));