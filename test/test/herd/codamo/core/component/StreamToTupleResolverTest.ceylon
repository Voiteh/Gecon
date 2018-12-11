
import ceylon.test {
	test,
	assertTrue
}
import herd.codamo.transformer.collection.resolver {
	StreamToTupleResolver
}
shared class StreamToTupleResolverTest() {
	
	
	value streamToTupleResolver=StreamToTupleResolver();
	
	
	
	shared test void shouldResolveTupleTypeFromNonEmptyIterable(){
		//Tuple<String|Integer,Integer,Tuple<String,String,empty>> => [123,"asd"]
		{Anything+} testData={1,"asd",false};
		value resolve = streamToTupleResolver.resolve(MockContext(), testData, `[Anything]`);
		/*assertion failed: expected 
		 <Tuple<Integer|String|Boolean,Integer,Tuple<String|Boolean,String,Tuple<Boolean,Boolean,Empty>>>> 
		 <Tuple<false|String|Integer,Integer,Tuple<false|String,String,Tuple<false,false,empty>>>>*/
		assertTrue(resolve.subtypeOf(`[Integer,String,Boolean]`));
	}
	
	
}

