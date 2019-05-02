
import ceylon.test {
	test
}
import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class
}


import herd.gecon.core.api.transformer {
	Delegator
}

import herd.gecon.collection.transformer.resolver {
	MapToMapResolver
}

shared class MapToMapResolverTest() {
	
	
	value mapResolver=MapToMapResolver();
	
	shared test 
	void shouldResolveToHashMap(){
		Delegator delegator=MockDelagator();
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(delegator,HashMap<Integer,String>(),`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}