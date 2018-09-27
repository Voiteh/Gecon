import ceylon.test {
	test,
	ignore
}
import herd.convertx.core.component.creator.iterable {
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