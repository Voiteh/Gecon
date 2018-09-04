import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	testData
}

import herd.convertx.json {
	JSONObject
}
shared class AbstractionResolveTest() extends BaseJSONIntegrationTest(){
	
	
	shared test
	void shouldConvertTypeResolveOneIntoJSONObject(){
		value result=convertx.convert(testData.resolveOne,`JSONObject`);
		assertEquals(result,testData.resolveOneJSONObject);
	}
	
	shared test
	void shouldConvertTypeResolveTwoIntoJSONObject(){
		value result=convertx.convert(testData.resolveTwo,`JSONObject`);
		assertEquals(result,testData.resolveTwoJSONObject);
	}
	
	shared test
	void shouldConvertJSONObjectIntoTypeResolveOne(){
		value result=convertx.convert(testData.resolveOneJSONObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveOne);
	}
	
	shared test
	void shouldConvertJSONObjectIntoTypeResolveTwo(){
		value result=convertx.convert(testData.resolveTwoJSONObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveTwo);
	}
	
	
	
}