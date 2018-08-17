import ceylon.test {
	parameters,
	test,
	assertEquals
}
import herd.convertx.core {
	Convertx
}
import ceylon.language.meta {
	type
}
shared class SelfTest() {
	

	
	shared test  
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertIntegerToInteger(Convertx convertx){
		 	value result = convertx.convert(4, `Integer`);
		 	assertEquals(result,4);
	}
	
	shared test  
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertEnumToEnum(Convertx convertx){
		value result = convertx.convert(one, `EnumTwo`);
		assertEquals(result,one);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertSimpleModelToSimpleModel(Convertx convertx){
		value model=TestSimpleModel(1,"bla");
		value result=convertx.convert(model, `TestSimpleModel`);
		assertEquals(result,model);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertIterableToIterable(Convertx convertx){
		value stream={1,2,3};
		value result=convertx.convert(stream, type(stream));
		assertEquals(result,stream);
	}
}