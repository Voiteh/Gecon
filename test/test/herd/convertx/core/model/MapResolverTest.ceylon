import herd.convertx.core.model.component.resolver.iterable {
	MapResolver
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
shared class MapResolverTest() {
	
	
	value mapResolver=MapResolver();
	
	
	
	shared test void shouldResolveToHashMap(){
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}