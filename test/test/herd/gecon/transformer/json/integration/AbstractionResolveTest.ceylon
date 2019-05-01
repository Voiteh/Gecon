import ceylon.test {
	test,
	assertEquals
}
import test.herd.gecon.transformer.json.integration.data {
	TypeResolveInterface,
	testData,
	JsonObjectToTestResolveInterfaceResolver
}



import ceylon.json {
	JsonObject
}


import herd.gecon.engine {
	AutoProvider,
	Codamo,
	ScopeProvisioning
}


shared class AbstractionResolveTest() extends JsonIntegration(){
	
	shared actual Codamo codamo => Codamo {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[`module herd.gecon.transformer.json`,
				`module herd.gecon.transformer.core`,
				`module herd.gecon.transformer.collection`,
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