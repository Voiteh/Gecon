import ceylon.test {
	test
}

import herd.modaco.api.operation {
	Operation
}

import herd.modaco.api.provision {
	WireingProvider
}

shared class WiredProviderTest() {
	
	value wiredProvider=WireingProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.operations.find((Operation elem) => elem is WiredConverter));
	}
	
	
	
	
}