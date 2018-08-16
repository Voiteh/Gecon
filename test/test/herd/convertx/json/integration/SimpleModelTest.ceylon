import ceylon.test {
	test,
	parameters,
	assertEquals
}
import herd.convertx.core {
	Convertx
}
import herd.convertx.json {
	JSONValue,
	JSONObject
}
import test.herd.convertx.json.integration.data {
	SimpleModel,
	simpleModelParams
	
}
shared class SimpleModelTest() {
	
	shared test 
	parameters(`value simpleModelParams`)
	void shouldConvertJSONObjectToModel(Convertx convertx, JSONObject simpleModelJSONObject, SimpleModel simpleModel){
		value result=convertx.convert(simpleModelJSONObject, `SimpleModel`);
		assertEquals(result,simpleModel);
	}
	
	shared test 
	parameters(`value simpleModelParams`)
	void shouldConvertModelToJSONObject(Convertx convertx, JSONObject simpleModelJSONObject, SimpleModel simpleModel){
		value result=convertx.convert(simpleModel,`JSONObject`);
		assertEquals(result,simpleModelJSONObject);
	}
	
	shared test
	parameters(`value simpleModelParams`)
	void shouldConvertJSONObjectToMap(Convertx convertx, JSONObject simpleModelJSONObject, SimpleModel simpleModel){
		assert(is Map<String,Anything > result=convertx.convert(simpleModelJSONObject, `Map<String,Anything>`));
		simpleModelJSONObject.each((String elementKey -> JSONValue elementItem) {
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