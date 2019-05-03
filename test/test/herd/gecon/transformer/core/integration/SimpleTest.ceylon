import ceylon.test {
	assertEquals,
	test
}

shared class SimpleTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertSimpleToSelf() {
		assertEquals(gecon.convert(4, `Integer`), 4);
	}
	shared test
	void shouldConvertStringToInteger() {
		assertEquals(gecon.convert("4", `Integer`), 4);
	}
	
	shared test
	void shouldConvertStringToByte() {
		assertEquals(gecon.convert("4", `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertStringToFloat() {
		assertEquals(gecon.convert("4", `Float`), 4.0);
	}
	
	shared test
	void shouldConvertStringToCharacter() {
		assertEquals(gecon.convert("4", `Character`), '4');
	}
	
	shared test
	void shouldConvertStringToBoolean() {
		assertEquals(gecon.convert("true", `Boolean`), true);
	}
	
	shared test
	void shouldConvertBooleanToString() {
		assertEquals(gecon.convert(true, `String`), "true");
	}
	shared test
	void shouldConvertIntegerToString() {
		assertEquals(gecon.convert(4, `String`), "4");
	}
	
	shared test
	void shouldConvertIntegerToByte() {
		assertEquals(gecon.convert(4, `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertIntegerToFloat() {
		assertEquals(gecon.convert(4, `Float`), 4.0);
	}
	shared test
	void shouldConvertIntegerToCharacter() {
		assertEquals(gecon.convert(65, `Character`), 'A');
	}
	
	shared test
	void shouldConvertByteToString() {
		assertEquals(gecon.convert(4.byte, `String`), "4");
	}
	
	shared test
	void shouldConvertFloatToString() {
		assertEquals(gecon.convert(4.0, `String`), "4.0");
	}
	
	shared test
	void shouldConvertBooleanToInteger() {
		assertEquals(gecon.convert(true, `Integer`), 1);
	}
	
	shared test
	void shouldConvertCharacterToInteger() {
		assertEquals(gecon.convert('A', `Integer`), 65);
	}
}
