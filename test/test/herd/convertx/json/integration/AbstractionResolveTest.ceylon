import ceylon.test {
	test,
	parameters,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	typeResolveOneParams,
	typeResolveTwoParams
}
import herd.convertx.core {
	Convertx
}
import herd.convertx.json {
	JSONObject
}
shared class AbstractionResolveTest() {
	
	
	shared test
	parameters(`value typeResolveOneParams`)
	void shouldConvertTypeResolveOneIntoJSONObject(Convertx convertx,JSONObject jsonObject,TypeResolveInterface resolve){
		value result=convertx.convert(resolve,`JSONObject`);
		assertEquals(result,jsonObject);
	}
	
	shared test
	parameters(`value typeResolveTwoParams`)
	void shouldConvertTypeResolveTwoIntoJSONObject(Convertx convertx,JSONObject jsonObject,TypeResolveInterface resolve){
		value result=convertx.convert(resolve,`JSONObject`);
		assertEquals(result,resolve);
	}
	
	shared test
	parameters(`value typeResolveOneParams`)
	void shouldConvertJSONObjectIntoTypeResolveOne(Convertx convertx,JSONObject jsonObject,TypeResolveInterface resolve){
		value result=convertx.convert(jsonObject,`TypeResolveInterface`);
		assertEquals(result,jsonObject);
	}
	
	shared test
	parameters(`value typeResolveTwoParams`)
	void shouldConvertJSONObjectIntoTypeResolveTwo(Convertx convertx,JSONObject jsonObject,TypeResolveInterface resolve){
		value result=convertx.convert(resolve,`JSONObject`);
		assertEquals(result,resolve);
	}
	
	
	
}