import ceylon.test {
	test
}

import herd.codamo.api.operation {
	ConvertionError
}
shared class EnumTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertEnumOneToEnumTwo(){
		assert(is EnumTwo adapt = convertx.convert(first, `EnumTwo`));
		assert(adapt==one);
	}
	
	shared test
	void shouldConvertEnumTwoToEnumOne(){
		assert(is EnumOne adapt=convertx.convert(one, `EnumOne`));
		assert(adapt==first);
	}
	
	shared test
	void shouldFailConvertEnumOneToEnumTwoWithIndexToHigh(){
		assert(is ConvertionError adapt = convertx.convert(fourth, `EnumTwo`));
		
	}
	
	
}