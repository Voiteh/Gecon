import ceylon.test {
	test
}
import herd.convertx.api.component {
	ConvertionException
}
shared class EnumTest() extends BaseTest() {
	
	
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
		assert(is ConvertionException adapt = convertx.convert(fourth, `EnumTwo`));
		
	}
	
	
}