import ceylon.test {
	assertEquals,
	test,
	parameters
}
import herd.convertx.core {
	Convertx
}
shared class SimpleTest() {
	
	
	shared test
	parameters(`value defaultIntegrationParameters`) 
	void shouldConvertSimpleToSelf(Convertx convertx){
		assertEquals(convertx.convert(4,`Integer`),4);
	}
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertStringToInteger(Convertx convertx){
		assertEquals(convertx.convert("4", `Integer`),4);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertStringToByte(Convertx convertx){
		assertEquals(convertx.convert("4", `Byte`),4.byte);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertStringToFloat(Convertx convertx){
		assertEquals(convertx.convert("4", `Float`),4.0);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertStringToCharacter(Convertx convertx){
		assertEquals(convertx.convert("4", `Character`),'4');
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertStringToBoolean(Convertx convertx){
		assertEquals(convertx.convert("true", `Boolean`),true);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertBooleanToString(Convertx convertx){
		assertEquals(convertx.convert(true, `String`),"true");
	}
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertIntegerToString(Convertx convertx){
		assertEquals(convertx.convert(4, `String`),"4");
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertIntegerToByte(Convertx convertx){
		assertEquals(convertx.convert(4, `Byte`),4.byte);
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`) 
	 void shouldConvertIntegerToFloat(Convertx convertx){
		assertEquals(convertx.convert(4, `Float`),4.0);
	}
	shared test
	parameters(`value defaultIntegrationParameters`) 
	 void shouldConvertIntegerToCharacter(Convertx convertx){
		assertEquals(convertx.convert(65, `Character`),'A');
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertByteToString(Convertx convertx){
		assertEquals(convertx.convert(4.byte, `String`),"4");
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`) 
	void shouldConvertFloatToString(Convertx convertx){
		assertEquals(convertx.convert(4.0,`String`),"4.0");
	}
	
	shared test
	parameters(`value defaultIntegrationParameters`)  
	void shouldConvertBooleanToInteger(Convertx convertx){
		assertEquals(convertx.convert(true,`Integer`),1);
	}
	
	
	shared test
	parameters(`value defaultIntegrationParameters`) 
	 void shouldConvertCharacterToInteger(Convertx convertx){
		assertEquals(convertx.convert('A',`Integer`),65);
	}
	
	
}