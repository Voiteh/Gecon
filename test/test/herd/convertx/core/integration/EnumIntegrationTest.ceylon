import herd.convertx.core {
	Convertx
}
import ceylon.test {
	test
}
import herd.convertx.core.api.component {
	ConvertionException
}
shared class EnumIntegrationTest() {
	Convertx convertx=Convertx();
	
	
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