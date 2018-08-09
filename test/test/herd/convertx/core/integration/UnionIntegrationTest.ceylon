import ceylon.test {
	test
}
import herd.convertx.core {
	Convertx
}
shared class UnionIntegrationTest() {
	
	
	value convertx =Convertx();
	
	shared test 
	void shouldConvertToUnion(){
		if(is Exception result=convertx.convert("5", `Integer?`)){
			throw result;
		}
		assert(is Integer result=convertx.convert("5", `Integer?`));
		assert(result==5);
	}
	
	shared test 
	void shouldConvertToUnionWithMovedTypes(){
		assert(is Integer result=convertx.convert("5", `Null|Integer`));
		assert(result==5);
	}
	shared test
	void shouldConvertToFloatBecauseOfUnionTypeIndexes(){
		assert(is Float result=convertx.convert("5", `Float|Integer`));
		assert(result==5.0);
	}
	
	
}