

import test.base.herd.convertx.integration {
	BaseTest
}
import herd.convertx.api.provision {
	Provider
}

import herd.convertx.core.provisioning {
	CoreProvider
}
import herd.convertx.json.provisioning {
	JsonProvider
}
shared class BaseJsonIntegrationTest()  extends BaseTest(){
	
	
	
	shared actual default Provider[] providers =>[CoreProvider(), JsonProvider()];
	
	
	
	
}