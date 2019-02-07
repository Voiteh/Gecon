import ceylon.test {
	test,
	assertEquals
}


shared class MetaTest() extends CoreIntegration() {
	
	shared test
	void shouldConvertTestModelOneToTwo() {
		value adapt = codamo.convert(testData.testSimpleModel, `TestOtherSimpleModel`);
		if (is Exception adapt) {
			throw adapt;
		}
		assertEquals(adapt, testData.testOtherSimpleModel);
	}
	

}
