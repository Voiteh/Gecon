import ceylon.test {
	test,
	assertEquals
}
import herd.convertx.json {
	JSONArray
}
import test.herd.convertx.json.integration.data { 
	testData
}
shared class IterableTest() extends BaseJSONIntegrationTest(){
	
	shared test
	void shouldConvertStreamToJSONArray() {
		value result = convertx.convert(testData.simpleStream, `JSONArray`);
		assertEquals(result, testData.simpleJSONArray);
	}
	
	shared test
	void shouldConvertJSONArrayToStream() {
		value result = convertx.convert(testData.simpleStream, `{Object*}`);
		assertEquals(result, testData.simpleJSONArray);
	}
	
	shared test
	void shouldConvertSequenceToJSONArray() {
		value result = convertx.convert(testData.simpleSequence, `JSONArray`);
		assertEquals(result, testData.simpleJSONArray);
	}
	
	shared test
	void shouldConvertJSONArrayToSequence() {
		value result = convertx.convert(testData.simpleJSONArray, `[Object*]`);
		assertEquals(result, testData.simpleSequence);
	}
	
	shared test
	void shouldConvertListToJSONArray() {
		value result = convertx.convert(testData.simpleListWithNull, `JSONArray`);
		assertEquals(result, testData.simpleJSONArrayWithNull);
	}
	shared test
	void shouldConvertJSONArrayToList() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `List<Anything>`);
		assertEquals(result, testData.simpleListWithNull);
	}
	
	shared test
	void shouldConvertSetToJSONArray() {
		value result = convertx.convert(testData.simpleSet, `JSONArray`);
		assertEquals(result, testData.simpleJSONArray);
	}
	shared test
	void shouldConvertJSONArrayToSet() {
		value result = convertx.convert(testData.simpleJSONArray, `Set<Object>`);
		assertEquals(result, testData.simpleSet);
	}
	shared test
	void shouldConvertArrayToJSONArray() {
		value result = convertx.convert(testData.simpleArrayWithNull, `JSONArray`);
		assertEquals(result, testData.simpleJSONArrayWithNull);
	}
	shared test
	void shouldConvertJSONArrayToArray() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `Array<Anything>`);
		assertEquals(result, testData.simpleArrayWithNull);
	}
	
	shared test
	void shouldConvertTupleToJSONArray() {
		value result = convertx.convert(testData.simpleTuple, `JSONArray`);
		assertEquals(result, testData.simpleJSONArray);
	}
	shared test
	void shouldConvertJSONArrayToTuple() {
		value result = convertx.convert(testData.simpleJSONArray, `[String, Integer]`);
		assertEquals(result, testData.simpleTuple);
	}
}
