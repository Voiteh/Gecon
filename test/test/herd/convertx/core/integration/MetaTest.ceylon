import ceylon.test {
	test,
	parameters
}
import herd.convertx.core {
	Convertx
}
shared class MetaTest() {
	
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertTestModelOneToTwo(Convertx convertx){
		value model=TestSimpleModel(1, "3");
		assert(is TestOtherSimpleModel adapt = convertx.convert(model, `TestOtherSimpleModel`));
		
	}
	
}