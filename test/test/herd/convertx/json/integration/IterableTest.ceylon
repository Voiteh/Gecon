import ceylon.test {
	test,
	parameters,
	assertEquals
}
import herd.convertx.json {
	JSONArray
}
import herd.convertx.core {
	Convertx
}
import test.herd.convertx.json.integration.data { 
	simpleStreamParams,
	simpleSequnceParams,
	simpleListWithNullParams,
	simpleSetParams,
	simpleArrayWithNullParams,
	simpleTupleParams
}
shared class IterableTest() {
	
	shared test
	parameters (`value simpleStreamParams`)
	void shouldConvertStreamToJSONArray(Convertx convertx, JSONArray jsonArray, {Object*} stream) {
		value result = convertx.convert(stream, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	
	shared test
	parameters (`value simpleStreamParams`)
	void shouldConvertJSONArrayToStream(Convertx convertx, JSONArray jsonArray, {Object*} stream) {
		value result = convertx.convert(stream, `{Object*}`);
		assertEquals(result, jsonArray);
	}
	
	shared test
	parameters (`value simpleSequnceParams`)
	void shouldConvertSequenceToJSONArray(Convertx convertx, JSONArray jsonArray, [Object*] sequence) {
		value result = convertx.convert(sequence, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	
	shared test
	parameters (`value simpleSequnceParams`)
	void shouldConvertJSONArrayToSequence(Convertx convertx, JSONArray jsonArray, [Object*] sequence) {
		value result = convertx.convert(jsonArray, `[Object*]`);
		assertEquals(result, sequence);
	}
	
	shared test
	parameters (`value simpleListWithNullParams`)
	void shouldConvertListToJSONArray(Convertx convertx, JSONArray jsonArray, List<Anything> list) {
		value result = convertx.convert(list, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	shared test
	parameters (`value simpleListWithNullParams`)
	void shouldConvertJSONArrayToList(Convertx convertx, JSONArray jsonArray, List<Anything> list) {
		value result = convertx.convert(jsonArray, `List<Anything>`);
		assertEquals(result, list);
	}
	
	shared test
	parameters (`value simpleSetParams`)
	void shouldConvertSetToJSONArray(Convertx convertx, JSONArray jsonArray, Set<Object> set) {
		value result = convertx.convert(set, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	shared test
	parameters (`value simpleSetParams`)
	void shouldConvertJSONArrayToSet(Convertx convertx, JSONArray jsonArray, Set<Object> set) {
		value result = convertx.convert(jsonArray, `Set<Object>`);
		assertEquals(result, set);
	}
	shared test
	parameters (`value simpleArrayWithNullParams`)
	void shouldConvertArrayToJSONArray(Convertx convertx, JSONArray jsonArray, Array<Anything> array) {
		value result = convertx.convert(array, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	shared test
	parameters (`value simpleArrayWithNullParams`)
	void shouldConvertJSONArrayToArray(Convertx convertx, JSONArray jsonArray, Array<Anything> array) {
		value result = convertx.convert(jsonArray, `List<Anything>`);
		assertEquals(result, array);
	}
	
	shared test
	parameters (`value simpleTupleParams`)
	void shouldConvertTupleToJSONArray(Convertx convertx, JSONArray jsonArray, [String, Integer] touple) {
		value result = convertx.convert(touple, `JSONArray`);
		assertEquals(result, jsonArray);
	}
	shared test
	parameters (`value simpleTupleParams`)
	void shouldConvertJSONArrayToTuple(Convertx convertx, JSONArray jsonArray, [String, Integer] touple) {
		value result = convertx.convert(jsonArray, `[String, Integer]`);
		assertEquals(result, touple);
	}
}
