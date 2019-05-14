import ceylon.test {
	test
}
shared class UnionTest() extends CoreIntegration(){
	
	
	shared test 
	void shouldConvertToUnion(){
		if(is Exception result=gecon.transform("5", `Integer?`)){
			throw result;
		}
		assert(is Integer result=gecon.transform("5", `Integer?`));
		assert(result==5);
	}
	
	shared test 
	void shouldConvertToUnionWithMovedTypes(){
		assert(is Integer result=gecon.transform("5", `Null|Integer`));
		assert(result==5);
	}
	shared test
	void shouldConvertToFloatBecauseOfUnionTypeIndexes(){
		assert(is Float result=gecon.transform("5", `Float|Integer`));
		assert(result==5.0);
	}
	
	
}