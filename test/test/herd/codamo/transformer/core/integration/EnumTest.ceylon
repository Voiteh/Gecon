import ceylon.test {
	test
}

import herd.codamo.api.core.transformer {
	Convertion
}



shared class EnumTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertEnumOneToEnumTwo(){
		assert(is EnumTwo adapt = codamo.convert(first, `EnumTwo`));
		assert(adapt==one);
	}
	
	shared test
	void shouldConvertEnumTwoToEnumOne(){
		assert(is EnumOne adapt=codamo.convert(one, `EnumOne`));
		assert(adapt==first);
	}
	
	shared test
	void shouldFailConvertEnumOneToEnumTwoWithIndexToHigh(){
		assert(is Convertion<>.Error adapt = codamo.convert(fourth, `EnumTwo`));
		
	}
	
	
}