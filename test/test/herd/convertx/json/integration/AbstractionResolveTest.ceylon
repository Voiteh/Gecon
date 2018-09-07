import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	testData,
	JSONObjectToTestResolveInterfaceResolver
}

import herd.convertx.json {
	JSONObject
}
import herd.convertx.core.api {
	Provider
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import herd.convertx.core.api.component {
	Component
}
shared class AbstractionResolveTest() extends BaseJSONIntegrationTest(){
	
	object resolvingProvider satisfies Provider{
		shared actual MutableList<Component> components = ArrayList<Component>{
			elements = {
				JSONObjectToTestResolveInterfaceResolver()
			};
	};
		
		
	}
	
	shared actual {Provider*} additionalProviders => super.additionalProviders.follow(resolvingProvider);
	
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