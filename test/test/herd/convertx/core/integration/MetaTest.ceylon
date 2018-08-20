import ceylon.test {
	test
}
shared class MetaTest() extends BaseTest(){
	
	
	shared test
	void shouldConvertTestModelOneToTwo(){
		value model=TestSimpleModel(1, "3");
		assert(is TestOtherSimpleModel adapt = convertx.convert(model, `TestOtherSimpleModel`));
		
	}
	
}