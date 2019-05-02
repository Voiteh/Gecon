import ceylon.test {
	test,
	assertEquals
}
import test.herd.gecon.json.transformer.integration.data {
	TypeResolveInterface,
	testData,
	JsonObjectToTestResolveInterfaceResolver
}



import ceylon.json {
	JsonObject
}


import herd.gecon.core.engine {
	AutoProvider,
	Codamo,
	ScopeProvisioning
}


shared class AbstractionResolveTest() extends JsonIntegration(){
	
	shared actual Codamo codamo => Codamo {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[`module herd.gecon.json.transformer`,
				`module herd.gecon.core.transformer`,
				`module herd.gecon.collection.transformer`,
				`module test.gecon.transformer`,
				`class JsonObjectToTestResolveInterfaceResolver`]
			);
		};
	};
	
	
	shared test
	void shouldConvertTypeResolveOneIntoJsonObject(){
		value result=codamo.convert(testData.resolveOne,`JsonObject`);
		assertEquals(result,testData.resolveOneJsonObject);
	}
	
	shared test
	void shouldConvertTypeResolveTwoIntoJsonObject(){
		value result=codamo.convert(testData.resolveTwo,`JsonObject`);
		assertEquals(result,testData.resolveTwoJsonObject);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveOne(){
		value result=codamo.convert(testData.resolveOneJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveOne);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveTwo(){
		value result=codamo.convert(testData.resolveTwoJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveTwo);
	}
	
}