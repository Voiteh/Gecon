import ceylon.test {
	test,
	assertEquals
}

import herd.gecon.transformer.core.generic.converter {
	SelfConverter
}
import test.herd.gecon.transformer.core {
	MockDelegator
}
shared class SelfConverterTest() {
	
	SelfConverter selfConverter=SelfConverter();
	
	shared test 
	void shouldaMatchNullObjectToNullType(){
		selfConverter.matcher.predicate(null, `Null`);
	}

	shared test 
	void shouldConvertObjectNullToNullType(){
		value result=selfConverter.convert(MockDelegator(), null, `Null`);
		assertEquals(result, null);
	}
	
	
}