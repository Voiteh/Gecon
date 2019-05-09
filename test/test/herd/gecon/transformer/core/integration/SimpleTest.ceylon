import ceylon.test {
	assertEquals,
	test
}

shared class SimpleTest() extends CoreIntegration() {
	
	
	shared test
	void shouldConvertSimpleToSelf() {
		assertEquals(gecon.transform(4, `Integer`), 4);
	}
	shared test
	void shouldConvertStringToInteger() {
		assertEquals(gecon.transform("4", `Integer`), 4);
	}
	
	shared test
	void shouldConvertStringToByte() {
		assertEquals(gecon.transform("4", `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertStringToFloat() {
		assertEquals(gecon.transform("4", `Float`), 4.0);
	}
	
	shared test
	void shouldConvertStringToCharacter() {
		assertEquals(gecon.transform("4", `Character`), '4');
	}
	
	shared test
	void shouldConvertStringToBoolean() {
		assertEquals(gecon.transform("true", `Boolean`), true);
	}
	
	shared test
	void shouldConvertBooleanToString() {
		assertEquals(gecon.transform(true, `String`), "true");
	}
	shared test
	void shouldConvertIntegerToString() {
		assertEquals(gecon.transform(4, `String`), "4");
	}
	
	shared test
	void shouldConvertIntegerToByte() {
		assertEquals(gecon.transform(4, `Byte`), 4.byte);
	}
	
	shared test
	void shouldConvertIntegerToFloat() {
		assertEquals(gecon.transform(4, `Float`), 4.0);
	}
	shared test
	void shouldConvertIntegerToCharacter() {
		assertEquals(gecon.transform(65, `Character`), 'A');
	}
	
	shared test
	void shouldConvertByteToString() {
		assertEquals(gecon.transform(4.byte, `String`), "4");
	}
	
	shared test
	void shouldConvertFloatToString() {
		assertEquals(gecon.transform(4.0, `String`), "4.0");
	}
	
	shared test
	void shouldConvertBooleanToInteger() {
		assertEquals(gecon.transform(true, `Integer`), 1);
	}
	
	shared test
	void shouldConvertCharacterToInteger() {
		assertEquals(gecon.transform('A', `Integer`), 65);
	}
}
