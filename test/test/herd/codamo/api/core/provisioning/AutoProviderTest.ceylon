import ceylon.test {
	test
}



import herd.codamo.api.core.provision {
	AutoProvider
}
import herd.codamo.api.core.transformer {
	Transformation
}

shared class AutoProviderTest() {
	
	value wiredProvider=AutoProvider(`module`);
	
	
	shared test
	void shouldProvideWiredConverter(){
		assert(exists converter=wiredProvider.operations.find((Transformation elem) => elem is AutoProvidedConverter));
	}
	
	
	
	
}