import ceylon.test {
	test,
	parameters
}
import herd.convertx.core {
	Convertx
}
shared class UnionTest() {
	
	
	shared test 
	parameters(`value defaultIntegrationParameters`) 
	void shouldConvertToUnion(Convertx convertx){
		if(is Exception result=convertx.convert("5", `Integer?`)){
			throw result;
		}
		assert(is Integer result=convertx.convert("5", `Integer?`));
		assert(result==5);
	}
	
	shared test 
	parameters(`value defaultIntegrationParameters`) 
	void shouldConvertToUnionWithMovedTypes(Convertx convertx){
		assert(is Integer result=convertx.convert("5", `Null|Integer`));
		assert(result==5);
	}
	shared test
	parameters(`value defaultIntegrationParameters`) 
	void shouldConvertToFloatBecauseOfUnionTypeIndexes(Convertx convertx){
		assert(is Float result=convertx.convert("5", `Float|Integer`));
		assert(result==5.0);
	}
	
	
}