import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	testData,
	JsonObjectToTestResolveInterfaceResolver
}

import herd.convertx.api {
	Provider
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import herd.convertx.api.operation {
	Operation
}
import ceylon.json {
	JsonObject
}
import herd.convertx.api.configuration {
	Configuration
}
shared class AbstractionResolveTest() extends BaseJsonIntegrationTest(){
	
	object resolvingProvider satisfies Provider{
		shared actual MutableList<Operation> components = ArrayList<Operation>{
			elements = {
				JsonObjectToTestResolveInterfaceResolver()
			};
	};
		shared actual MutableList<Configuration> configurations => ArrayList<Configuration>();
		
	}
	
	shared actual Provider[] providers => super.providers.follow(resolvingProvider).sequence();
	
	shared test
	void shouldConvertTypeResolveOneIntoJsonObject(){
		value result=convertx.convert(testData.resolveOne,`JsonObject`);
		assertEquals(result,testData.resolveOneJsonObject);
	}
	
	shared test
	void shouldConvertTypeResolveTwoIntoJsonObject(){
		value result=convertx.convert(testData.resolveTwo,`JsonObject`);
		assertEquals(result,testData.resolveTwoJsonObject);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveOne(){
		value result=convertx.convert(testData.resolveOneJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveOne);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveTwo(){
		value result=convertx.convert(testData.resolveTwoJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveTwo);
	}
	
	
	
}