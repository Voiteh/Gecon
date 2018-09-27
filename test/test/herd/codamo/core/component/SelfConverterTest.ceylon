import ceylon.test {
	test,
	assertEquals
}
import herd.codamo.core.component.converter {
	SelfConverter
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
		value result=selfConverter.convert(MockContext(), null, `Null`);
		assertEquals(result, null);
	}
	
	
}