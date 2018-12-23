
import ceylon.test {
	test,
	assertTrue
}
import ceylon.collection {
	ListMutator
}
import herd.codamo.transformer.collection.resolver {
	MutableListResolver
}
shared class MutableListResolverTest() {
	
	
	value resolver=MutableListResolver();
	
	shared test void shouldMatchToSequentialInputAndMutableListType(){
		assert(exists matcher=resolver.matcher);
		assertTrue(matcher.match([1,2,3], `ListMutator<String>`));
	}
	
}