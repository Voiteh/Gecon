import ceylon.test {
	test,
	assertEquals
}
import ceylon.collection {
	HashMap
}

shared class MetaTest() extends BaseTest() {
	
	shared test
	void shouldConvertTestModelOneToTwo() {
		value adapt = convertx.convert(testSimpleModel, `TestOtherSimpleModel`);
		if (is Exception adapt) {
			throw adapt;
		}
		assertEquals(adapt, testOtherSimpleModel);
	}
	
	shared test
	void shouldConvertObjectToMap() {
		value result = convertx.convert(testSimpleModel, `Map<String,Anything>`);
		assert (is Map<String,Anything> result);
		assertEquals(result.get(`TestSimpleModel.id`.declaration.name), testSimpleModel.id);
		assertEquals(result.get(`TestSimpleModel.name`.declaration.name), testSimpleModel.name);
	}
	
	shared test
	void shouldConvertMapToObject() {
		value map = HashMap<String,Anything> {
			entries = {
				`TestSimpleModel.id`.declaration.name->testSimpleModel.id,
				`TestSimpleModel.name`.declaration.name->testSimpleModel.name
			};
		};
		value result = convertx.convert(map, `TestSimpleModel`);
		assertEquals(result, testSimpleModel);
	}
}
