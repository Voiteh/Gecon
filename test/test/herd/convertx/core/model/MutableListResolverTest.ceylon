import herd.convertx.core.model.component.resolver.iterable {
	MutableListResolver
}
import ceylon.test {
	test,
	assertTrue
}
import ceylon.collection {
	MutableList,
	ListMutator
}
shared class MutableListResolverTest() {
	
	
	value resolver=MutableListResolver();
	
	shared test void shouldMatchToSequentialInputAndMutableListType(){
		assert(exists matcher=resolver.matcher);
		assertTrue(matcher.match([1,2,3], `ListMutator<String>`));
	}
	
}