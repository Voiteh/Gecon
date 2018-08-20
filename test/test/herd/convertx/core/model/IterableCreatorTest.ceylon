import ceylon.test {
	test,
	ignore
}
import herd.convertx.core.model.component.creator.iterable {
	ArrayCreator
}
import herd.convertx.core.api {
	Context
}
shared class IterableCreatorTest() {
	
	shared ignore("Failing because of https://github.com/eclipse/ceylon/issues/7390")test 
	void shouldCreateIntegerArray(){
		value context =MockContext();
		value create = ArrayCreator().create(context,`Array<Integer>`, {1,2,3});
		assert(create.containsEvery({1,2,3}));
	}
	
	
	
	
}