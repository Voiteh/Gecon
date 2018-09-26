import ceylon.test {
	test
}
import herd.convertx.api.support {
	WireingProvider
}
import herd.convertx.api.operation {
	Operation
}
import test.herd.convertx.core.api {
	WiredConverter
}
shared class WiredProviderTest() {
	
	value wiredProvider=WireingProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.components.find((Operation elem) => elem is WiredConverter));
	}
	
	
	
	
}