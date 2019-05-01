import ceylon.test {
	test,
	ignore
}
import herd.gecon.transformer.core.iterable.creator {
	ArrayCreator
}

import test.herd.gecon.transformer.core {
	MockDelegator
}


shared class IterableCreatorTest() {
	
	shared ignore("Failing because of https://github.com/eclipse/ceylon/issues/7390")test 
	void shouldCreateIntegerArray(){
		value delegator =MockDelegator();
		value create = ArrayCreator().create(delegator, {1,2,3},`Array<Integer>`);
		assert(create.containsEvery({1,2,3}));
	}
	
	
	
	
}