import ceylon.test {
	assertEquals,
	test
}

import ceylon.collection {
	HashMap
}



shared class MapIntegrationTest() extends CollectionIntegration(){
	
	
	shared test 
	void shouldConvertConcreteMapToGenericMap(){
		assert(is Map<String,Anything> result= gecon.convert(testData.concreteStringIntegerMap, `Map<String,Anything>`));
		testData.concreteStringIntegerMap.each((String elementKey -> Integer elementItem) {
			value resultItem=result.get(elementKey);
			assert(is Integer resultItem );
			assertEquals(elementItem,resultItem);
		});
	}
	shared test
	void shouldConvertConcreteUnionMapToGenericMap(){
		assert(is Map<String,Anything> result= gecon.convert(testData.concreteStringUnionMap, `Map<String,Anything>`));
		testData.concreteStringUnionMap.each((String elementKey -> Integer? elementItem) {
			value resultItem=result.get(elementKey);
			assert(is Integer? resultItem );
			assertEquals(elementItem,resultItem);
		});
	}
	shared test 
	void shouldConvertIterableToSet(){
		assert(is Set<String> result=gecon.convert({1,2,3},`Set<String>`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	shared test
	void shouldConvertObjectToMap() {
		value result = gecon.convert(testData.testSimpleModel, `Map<String,Anything>`);
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
		value result = gecon.convert(map, `TestSimpleModel`);
		assertEquals(result, testData.testSimpleModel);
	}
}