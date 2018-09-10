import ceylon.test {
	test,
	ignore,
	assertEquals
}
import ceylon.collection {
	ArrayList,
	MutableList
}
import herd.convertx.core.api.component {
	ConvertionException
}
import ceylon.logging {
	debug,
	trace
}
import herd.convertx.core {
	logger
}
shared class IterableTest() extends BaseTest(){
	
	
	Boolean checkIterableEquality<Type,Item>(Anything result, Anything target) 
			given Type satisfies {Item*} {
		if (is Type result, is Type target) {
			for (Integer->Item indexed in target.indexed) {
				Item indexedItem = indexed.item;
				Item? get = result.getFromFirst(indexed.key);
				Boolean bothNotExists = !indexedItem exists && !get exists;
				Boolean bothExists = indexedItem exists && get exists;
				Boolean andResult = bothExists || bothNotExists;
				if (!andResult) {
					return false;
				}
			}
			return true;
		}
		return false;
	}
	
	shared test 
	void shouldConvertIterableToIterable(){
		value result=convertx.convert(testData.iterable.integer.stream,`{String*}`);
		 assertEquals{
		 	actual=result;
		 	expected=testData.iterable.strings.stream;
		 	compare=checkIterableEquality<{String*},String>;
		 };
	}
	
	shared test 
	void shouldConvertIterableToNonEmptyIterable(){
		
		value result=convertx.convert(testData.iterable.integer.stream,`{String+}`);
		assertEquals{
			actual=result;
			expected=testData.iterable.strings.nonEmptyStream;
			compare=checkIterableEquality<{String+},String>;
		};
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
		logger.priority=trace;
		assert(is MutableList<String> result=convertx.convert({1,2,3},`MutableList<String>`)); 
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
	
	shared test 
	void shouldConvertConcreteMapToGenericMap(){
		assert(is Map<String,Anything> result= convertx.convert(testData.concreteStringIntegerMap, `Map<String,Anything>`));
		testData.concreteStringIntegerMap.each((String elementKey -> Integer elementItem) {
			value resultItem=result.get(elementKey);
			assert(is Integer resultItem );
			assertEquals(elementItem,resultItem);
		});
	}
	shared test
	void shouldConvertConcreteUnionMapToGenericMap(){
		assert(is Map<String,Anything> result= convertx.convert(testData.concreteStringUnionMap, `Map<String,Anything>`));
		testData.concreteStringUnionMap.each((String elementKey -> Integer? elementItem) {
			value resultItem=result.get(elementKey);
			assert(is Integer? resultItem );
			assertEquals(elementItem,resultItem);
		});
	}
	
	shared test
	void shouldConvertIterableToSequence(){
		logger.priority=debug;
		value result=convertx.convert(testData.iterable.integer.stream,`[String*]`);
		assertEquals{
			actual=result;
			expected=testData.iterable.strings.sequence;
			compare=checkIterableEquality<[String*],String>;
		};
	}
	
	shared test
	void shouldConvertIterableToNonEmptySequence(){
		value result=convertx.convert(testData.iterable.integer.stream,`[String+]`);
		assertEquals{
			actual=result;
			expected=testData.iterable.strings.sequence;
			compare=checkIterableEquality<[String*],String>;
		};
	}
	
}