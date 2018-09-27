import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	testData,
	JsonObjectToTestResolveInterfaceResolver
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
import herd.convertx.api.provision {
	Provider
}
Provider resolvingProvider =object satisfies Provider{
	shared actual {Configuration*} configurations = {};
	
	shared actual {Operation*} operations = [JsonObjectToTestResolveInterfaceResolver()];
	
};

shared class AbstractionResolveTest() extends JsonIntegration([resolvingProvider]){
	
	
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