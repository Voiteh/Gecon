import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
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
		value result=convertx.convert(testData.simpleModelJsonObject, `SimpleModel`);
		assertEquals(result,testData.simpleModel);
	}
	
	shared test 
	void shouldConvertModelToJsonObject(){
		value result=convertx.convert(testData.simpleModel,`JsonObject`);
		assertEquals(result,testData.simpleModelJsonObject);
	}
	
	shared test
	void shouldConvertJsonObjectToMap(){
		value result=convertx.convert(testData.simpleModelJsonObject, `Map<String,Anything>`);
		assert(is Map<String,Anything > result);
		testData.simpleModelJsonObject.each((String elementKey -> Value elementItem) {
			value item=result.get(elementKey);
			assertEquals(item,elementItem);
		});
	}
}