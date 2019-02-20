import ceylon.test {
	test,
	assertEquals
}

import herd.codamo.transformer.core.generic.converter {
	SelfConverter
}
import test.herd.codamo.transformer.core {
	MockDelegator
}
shared class SelfConverterTest() {
	
	SelfConverter selfConverter=SelfConverter();
	
	shared test 
	void shouldaMatchNullObjectToNullType(){
		assert(exists matcher=selfConverter.matcher);
		matcher.match(null, `Null`);
	}

	shared test 
	void shouldConvertObjectNullToNullType(){
		value result=selfConverter.convert(MockDelegator(), null, `Null`);
		assertEquals(result, null);
	}
	
	
}