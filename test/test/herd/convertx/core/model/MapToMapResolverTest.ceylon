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
import herd.convertx.api {
	Context
}
shared class MapToMapResolverTest() {
	
	
	value mapResolver=MapToMapResolver();
	
	shared test 
	void shouldResolveToHashMap(){
		Context context=MockContext();
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(context,HashMap<Integer,String>(),`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}