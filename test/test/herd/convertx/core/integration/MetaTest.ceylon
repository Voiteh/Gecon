import ceylon.test {
	test,
	assertEquals
}
import ceylon.collection {
	HashMap
}

shared class MetaTest() extends CoreIntegration() {
	
	shared test
	void shouldConvertTestModelOneToTwo() {
		value adapt = convertx.convert(testData.testSimpleModel, `TestOtherSimpleModel`);
		if (is Exception adapt) {
			throw adapt;
		}
		assertEquals(adapt, testData.testOtherSimpleModel);
	}
	
	shared test
	void shouldConvertObjectToMap() {
		value result = convertx.convert(testData.testSimpleModel, `Map<String,Anything>`);
		assert (is Map<String,Anything> result);
		assertEquals(result.get(`TestSimpleModel.id`.declaration.name), testData.testSimpleModel.id);
		assertEquals(result.get(`TestSimpleModel.name`.declaration.name), testData.testSimpleModel.name);
	}
	
	shared test
	void shouldConvertMapToObject() {
		value map = HashMap<String,Anything> {
			entries = {
				`TestSimpleModel.id`.declaration.name->testData.testSimpleModel.id,
				`TestSimpleModel.name`.declaration.name->testData.testSimpleModel.name
			};
		};
		value result = convertx.convert(map, `TestSimpleModel`);
		assertEquals(result, testData.testSimpleModel);
	}
}
