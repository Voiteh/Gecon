import herd.convertx.core.model.component.resolver.iterable {
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
shared class MapToMapResolverTest() {
	
	
	value mapResolver=MapToMapResolver();
	
	
	
	shared test void shouldResolveToHashMap(){
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(HashMap<Integer,String>(),`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}