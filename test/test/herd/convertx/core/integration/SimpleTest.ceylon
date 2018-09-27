import ceylon.test {
	assertEquals,
	test
}
import test.base.herd.convertx.integration {
	IntegrationTest
}

shared class SimpleTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertSimpleToSelf() {
		assertEquals(convertx.convert(4, `Integer`), 4);
	}
	shared test
	void shouldConvertStringToInteger() {
		assertEquals(convertx.convert("4", `Integer`), 4);
	}
	
	shared test
	void shouldConvertStringToByte() {
		assertEquals(convertx.convert("4", `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertStringToFloat() {
		assertEquals(convertx.convert("4", `Float`), 4.0);
	}
	
	shared test
	void shouldConvertStringToCharacter() {
		assertEquals(convertx.convert("4", `Character`), '4');
	}
	
	shared test
	void shouldConvertStringToBoolean() {
		assertEquals(convertx.convert("true", `Boolean`), true);
	}
	
	shared test
	void shouldConvertBooleanToString() {
		assertEquals(convertx.convert(true, `String`), "true");
	}
	shared test
	void shouldConvertIntegerToString() {
		assertEquals(convertx.convert(4, `String`), "4");
	}
	
	shared test
	void shouldConvertIntegerToByte() {
		assertEquals(convertx.convert(4, `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertIntegerToFloat() {
		assertEquals(convertx.convert(4, `Float`), 4.0);
	}
	shared test
	void shouldConvertIntegerToCharacter() {
		assertEquals(convertx.convert(65, `Character`), 'A');
	}
	
	shared test
	void shouldConvertByteToString() {
		assertEquals(convertx.convert(4.byte, `String`), "4");
	}
	
	shared test
	void shouldConvertFloatToString() {
		assertEquals(convertx.convert(4.0, `String`), "4.0");
	}
	
	shared test
	void shouldConvertBooleanToInteger() {
		assertEquals(convertx.convert(true, `Integer`), 1);
	}
	
	shared test
	void shouldConvertCharacterToInteger() {
		assertEquals(convertx.convert('A', `Integer`), 65);
	}
}
