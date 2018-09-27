import ceylon.test {
	test
}

import herd.codamo.api.operation {
	Operation
}

import herd.codamo.api.provision {
	WireingProvider
}

shared class WiredProviderTest() {
	
	value wiredProvider=WireingProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.operations.find((Operation elem) => elem is WiredConverter));
	}
	
	
	
	
}