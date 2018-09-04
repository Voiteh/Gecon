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
shared class SimpleModelTest() extends BaseJSONIntegrationTest() {
	
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
		assert(is Map<String,Anything > result=convertx.convert(testData.simpleModelJSONObject, `Map<String,Anything>`));
		testData.simpleModelJSONObject.each((String elementKey -> JSONValue elementItem) {
			value item=result.get(elementKey);
			if(exists elementItem){
				assert(exists item);
				assertEquals(item,elementItem);
			}
			else{
				assert(!exists item);
			}
		});
	}
}