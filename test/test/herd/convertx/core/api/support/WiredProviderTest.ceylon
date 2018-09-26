import ceylon.test {
	test
}
import herd.convertx.core.api.support {
	WireingProvider
}
import herd.convertx.core.api.component {
	Component
}
import test.herd.convertx.core.api {
	WiredConverter
}
shared class WiredProviderTest() {
	
	value wiredProvider=WireingProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.components.find((Component elem) => elem is WiredConverter));
	}
	
	
	
	
}