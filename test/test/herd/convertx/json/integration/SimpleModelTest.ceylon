import ceylon.test {
	test,
	assertEquals
}
import herd.convertx.json {
	JSONValue,
	JSONObject
}
import test.herd.convertx.json.integration.data {
	SimpleModel,
	testData
	
}
shared class SimpleModelTest() extends BaseJsonIntegrationTest() {
	
	shared test 
	void shouldConvertJSONObjectToModel(){
		value result=convertx.convert(testData.simpleModelJSONObject, `SimpleModel`);
		assertEquals(result,testData.simpleModel);
	}
	
	shared test 
	void shouldConvertModelToJSONObject(){
		value result=convertx.convert(testData.simpleModel,`JSONObject`);
		assertEquals(result,testData.simpleModelJSONObject);
	}
	
	shared test
	void shouldConvertJSONObjectToMap(){
		value result=convertx.convert(testData.simpleModelJSONObject, `Map<String,Anything>`);
		assert(is Map<String,Anything > result);
		testData.simpleModelJSONObject.each((String elementKey -> JSONValue elementItem) {
			value item=result.get(elementKey);
			assertEquals(item,elementItem);
		});
	}
}