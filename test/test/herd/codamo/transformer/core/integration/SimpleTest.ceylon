import ceylon.test {
	assertEquals,
	test
}

shared class SimpleTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertSimpleToSelf() {
		assertEquals(codamo.convert(4, `Integer`), 4);
	}
	shared test
	void shouldConvertStringToInteger() {
		assertEquals(codamo.convert("4", `Integer`), 4);
	}
	
	shared test
	void shouldConvertStringToByte() {
		assertEquals(codamo.convert("4", `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertStringToFloat() {
		assertEquals(codamo.convert("4", `Float`), 4.0);
	}
	
	shared test
	void shouldConvertStringToCharacter() {
		assertEquals(codamo.convert("4", `Character`), '4');
	}
	
	shared test
	void shouldConvertStringToBoolean() {
		assertEquals(codamo.convert("true", `Boolean`), true);
	}
	
	shared test
	void shouldConvertBooleanToString() {
		assertEquals(codamo.convert(true, `String`), "true");
	}
	shared test
	void shouldConvertIntegerToString() {
		assertEquals(codamo.convert(4, `String`), "4");
	}
	
	shared test
	void shouldConvertIntegerToByte() {
		assertEquals(codamo.convert(4, `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertIntegerToFloat() {
		assertEquals(codamo.convert(4, `Float`), 4.0);
	}
	shared test
	void shouldConvertIntegerToCharacter() {
		assertEquals(codamo.convert(65, `Character`), 'A');
	}
	
	shared test
	void shouldConvertByteToString() {
		assertEquals(codamo.convert(4.byte, `String`), "4");
	}
	
	shared test
	void shouldConvertFloatToString() {
		assertEquals(codamo.convert(4.0, `String`), "4.0");
	}
	
	shared test
	void shouldConvertBooleanToInteger() {
		assertEquals(codamo.convert(true, `Integer`), 1);
	}
	
	shared test
	void shouldConvertCharacterToInteger() {
		assertEquals(codamo.convert('A', `Integer`), 65);
	}
}
