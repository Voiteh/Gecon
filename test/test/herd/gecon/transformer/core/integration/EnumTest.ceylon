import ceylon.test {
	test
}

import herd.gecon.core.api.transformer {
	Conversion
}



shared class EnumTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertEnumOneToEnumTwo(){
		assert(is EnumTwo adapt = gecon.transform(first, `EnumTwo`));
		assert(adapt==one);
	}
	
	shared test
	void shouldConvertEnumTwoToEnumOne(){
		assert(is EnumOne adapt=gecon.transform(one, `EnumOne`));
		assert(adapt==first);
	}
	
	shared test
	void shouldFailConvertEnumOneToEnumTwoWithIndexToHigh(){
		assert(is Conversion<>.Error adapt = gecon.transform(fourth, `EnumTwo`));
		
	}
	
	
}