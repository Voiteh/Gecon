import ceylon.test {
	test,
	ignore
}
import ceylon.collection {
	ArrayList
}
import herd.convertx.core.api.component {
	ConvertionException
}
shared class IterableTest() extends BaseTest(){
	
	
	shared test 
	void shouldConvertIterableToIterable(){
		assert(is {String*} result=convertx.convert({1,2,3},`{String*}`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	
	shared test 
	void shouldConvertIterableToSet(){
		assert(is Set<String> result=convertx.convert({1,2,3},`Set<String>`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	shared test 
	void shouldConvertIterableToList(){
		assert(is List<String> result=convertx.convert({1,2,3},`List<String>`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	
	shared test 
	void shouldConvertIterableToArrayList(){
		assert(is ArrayList<String> result=convertx.convert({1,2,3},`List<String>`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	shared ignore("Failing because of https://github.com/eclipse/ceylon/issues/7390") test
	void shouldConvertIterableToArray(){
		assert(is Array<String> result=convertx.convert({1,2,3}, `Array<String>`));
		assert(result.containsEvery({"1","2","3"}));
	}
	shared test
	void shouldConvertIterableToTouple(){
		assert(is [String,String,String] result=convertx.convert({1,2,3}, `[String,String,String]`));
		assert(result.first=="1");
		assert(result.rest.first=="2");
		assert(result.rest.rest.first=="3");
	}
	shared test
	void shouldConvertIterableToTupleWithDifferentTypes(){
		if(is Exception ex=convertx.convert({1,1,1}, `[String,Boolean,Float]`)){
			throw ex;
		}
		assert(is [String,Boolean,Float] result=convertx.convert({1,1,1}, `[String,Boolean,Float]`));
		assert(result.first=="1");
		assert(result.rest.first==true);
		assert(result.rest.rest.first==1.0);
	}
	
	shared test
	void shouldNotConvertIterableToToupleToFewArguments(){
		assert(is ConvertionException error=convertx.convert({1,2,3}, `[String,String,String,String]`));
	}
	shared test
	void shouldNotConvertIterableToToupleToManyArguments(){
		assert(is ConvertionException error=convertx.convert({1,2,3,4}, `[String,String,String]`));
	}
}