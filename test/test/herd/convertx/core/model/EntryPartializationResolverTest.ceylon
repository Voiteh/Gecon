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
import herd.convertx.api.meta {
	Partialization,
	Relation
}
import ceylon.language.meta.model {
	Class
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
		object relation satisfies Relation<TestModel,HashMap<String,Anything>>{
			shared actual Class<HashMap<String,Anything>,Nothing> resultClass => `HashMap<String,Anything>`;
			
			shared actual TestModel source => model;
			
			
		}
		value result=matcher.match(relation, `Partialization`);
		assertEquals(result,true);
	}
	
	
	
	
}