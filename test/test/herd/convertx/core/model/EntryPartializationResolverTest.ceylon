import ceylon.test {
	test,
	assertEquals
}
import herd.convertx.core.model.component.resolver {
	EntryPartializationResolver
}
import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.meta {
	Partialization
}

class TestModel(id,name){
	Integer id;
	String name;
}

shared class EntryPartializationResolverTest() {
	
	EntryPartializationResolver resolver = EntryPartializationResolver();
	
	shared test 
	void shouldMatchToEntryPartializationResolver(){
		assert(exists matcher=resolver.matcher);
		value model=TestModel(1,"ble");
		value input=model->`HashMap<String,Anything>`;
		value result=matcher.match(input, `Partialization`);
		assertEquals(result,true);
	}
	
	
	
	
}