import ceylon.test {
	test
}
import herd.convertx.core {
	Convertx
}
shared class MetaIntegrationTest() {
	
	value convertx=Convertx();
	
	shared test
	void shouldConvertTestModelOneToTwo(){
		value model=TestSimpleModel(1, "3");
		assert(is TestOtherSimpleModel adapt = convertx.convert(model, `TestOtherSimpleModel`));
		
	}
	
}