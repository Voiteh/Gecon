import ceylon.test {
	test,
	ignore
}

import herd.codamo.transformer.collection.creator {
	ArrayCreator
}
shared class IterableCreatorTest() {
	
	shared ignore("Failing because of https://github.com/eclipse/ceylon/issues/7390")test 
	void shouldCreateIntegerArray(){
		value delegator =MockContext();
		value create = ArrayCreator().create(delegator,`Array<Integer>`, {1,2,3});
		assert(create.containsEvery({1,2,3}));
	}
	
	
	
	
}