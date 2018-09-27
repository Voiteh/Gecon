import herd.modaco.core.component.resolver.iterable {
	MapToMapResolver
}
import ceylon.test {
	test
}
import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class
}

import herd.modaco.api.operation {
	Delegator
}
shared class MapToMapResolverTest() {
	
	
	value mapResolver=MapToMapResolver();
	
	shared test 
	void shouldResolveToHashMap(){
		Delegator delegator=MockContext();
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(delegator,HashMap<Integer,String>(),`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}