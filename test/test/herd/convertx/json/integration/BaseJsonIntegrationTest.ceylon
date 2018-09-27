import herd.convertx.json {
	JsonProvider
}
import herd.convertx.core.model {
	CoreProvider
}
import test.base.herd.convertx.integration {
	BaseTest
}
import herd.convertx.api.provision {
	Provider
}
shared class BaseJsonIntegrationTest()  extends BaseTest(){
	
	
	
	shared actual default Provider[] providers =>[CoreProvider(), JsonProvider()];
	
	
	
	
}