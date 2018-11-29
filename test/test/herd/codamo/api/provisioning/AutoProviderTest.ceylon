import ceylon.test {
	test
}

import herd.codamo.api.operation {
	Operation
}

import herd.codamo.api.provision {
	AutoProvider
}

shared class AutoProviderTest() {
	
	value wiredProvider=AutoProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.operations.find((Operation elem) => elem is AutoProvidedConverter));
	}
	
	
	
	
}