import ceylon.test {
	test
}
import herd.convertx.api.support {
	WireingProvider
}
import herd.convertx.api.component {
	Component
}
shared class WiredProviderTest() {
	
	value wiredProvider=WireingProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.components.find((Component elem) => elem is WireingProvider));
	}
	
	
	
	
}