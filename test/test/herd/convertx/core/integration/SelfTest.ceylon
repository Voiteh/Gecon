import ceylon.test {
	test,
	assertEquals
}
import ceylon.language.meta {
	type
}
import test.base.herd.convertx.integration {
	BaseTest
}
shared class SelfTest() extends BaseTest() {
	
	shared test  
	void shouldConvertIntegerToInteger(){
		 	value result = convertx.convert(4, `Integer`);
		 	assertEquals(result,4);
	}
	
	shared test  
	void shouldConvertEnumToEnum(){
		value result = convertx.convert(one, `EnumTwo`);
		assertEquals(result,one);
	}
	
	shared test
	void shouldConvertSimpleModelToSimpleModel(){
		value model=TestSimpleModel(1,"bla");
		value result=convertx.convert(model, `TestSimpleModel`);
		assertEquals(result,model);
	}
	
	shared test
	void shouldConvertIterableToIterable(){
		value stream={1,2,3};
		value result=convertx.convert(stream, type(stream));
		assertEquals(result,stream);
	}
}