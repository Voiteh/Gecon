import ceylon.test {
	test,
	assertEquals
}
import test.herd.codamo.transformer.json.integration.data {
	SimpleModel,
	testData
	
}
import ceylon.json {
	JsonObject,
	Value
}
shared class SimpleModelTest() extends JsonIntegration() {
	
	shared test 
	void shouldConvertJsonObjectToModel(){
		value result=codamo.convert(testData.simpleModelJsonObject, `SimpleModel`);
		assertEquals(result,testData.simpleModel);
	}
	
	shared test 
	void shouldConvertModelToJsonObject(){
		value result=codamo.convert(testData.simpleModel,`JsonObject`);
		assertEquals(result,testData.simpleModelJsonObject);
	}
	
	shared test
	void shouldConvertJsonObjectToMap(){
		value result=codamo.convert(testData.simpleModelJsonObject, `Map<String,Anything>`);
		assert(is Map<String,Anything> result);
		testData.simpleModelJsonObject.each((String elementKey -> Value elementItem) {
			value item=result.get(elementKey);
			assertEquals(item,elementItem);
		});
	}
}