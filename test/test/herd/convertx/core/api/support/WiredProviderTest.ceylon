import ceylon.test {
	test
}
import herd.convertx.core.api.support {
	WiredProvider
}
import herd.convertx.core.api.component {
	Component
}
import test.herd.convertx.core.api {
	WiredConverter
}
shared class WiredProviderTest() {
	
	value wiredProvider=WiredProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.components.find((Component elem) => elem is WiredConverter));
	}
	
	
	
	
}