import herd.convertx.core {
	Convertx
}
import ceylon.test {
	test,
	parameters
}
import herd.convertx.core.api.component {
	ConvertionException
}
shared class EnumTest() {
	
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertEnumOneToEnumTwo(Convertx convertx){
		assert(is EnumTwo adapt = convertx.convert(first, `EnumTwo`));
		assert(adapt==one);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertEnumTwoToEnumOne(Convertx convertx){
		assert(is EnumOne adapt=convertx.convert(one, `EnumOne`));
		assert(adapt==first);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`) 
	void shouldFailConvertEnumOneToEnumTwoWithIndexToHigh(Convertx convertx){
		assert(is ConvertionException adapt = convertx.convert(fourth, `EnumTwo`));
		
	}
	
	
}