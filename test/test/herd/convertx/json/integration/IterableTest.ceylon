import ceylon.test {
	test,
	assertEquals
}
import herd.convertx.json {
	JSONArray,
	JSONValue
}
import test.herd.convertx.json.integration.data {
	testData
}

shared class IterableTest() extends BaseJSONIntegrationTest() {
	
	Boolean assertJSONArrayEquality(Anything result, Anything target) {
		if (is JSONArray result, is JSONArray target) {
			for (Integer->JSONValue indexed in target.indexed) {
				JSONValue indexedItem = indexed.item;
				JSONValue get = result.get(indexed.key);
				Boolean andResult = indexedItem exists && get exists;
				if (andResult) {
					value indexes = result.indexesWhere((JSONValue element) {
							if (exists element, exists get) {
								return element == get;
							} else if (!exists element, !exists get) {
								return true;
							}
							return false;
						});
					if (!indexes.contains(indexed.key)) {
						return false;
					}
				} else {
					return false;
				}
			}
			return true;
		}
		return false;
	}
	
	shared test
	void shouldConvertStreamToJSONArray() {
		value result = convertx.convert(testData.simpleStream, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = assertJSONArrayEquality;
		};
	}
	
	shared test
	void shouldConvertJSONArrayToStream() {
		value result = convertx.convert(testData.simpleStream, `{Object*}`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = assertJSONArrayEquality;
		};

	}
	
	shared test
	void shouldConvertSequenceToJSONArray() {
		value result = convertx.convert(testData.simpleSequence, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = assertJSONArrayEquality;
		};
	}
	
	shared test
	void shouldConvertJSONArrayToSequence() {
		value result = convertx.convert(testData.simpleJSONArray, `[Object*]`);
		assertEquals(result, testData.simpleSequence);
	}
	
	shared test
	void shouldConvertListToJSONArray() {
		value result = convertx.convert(testData.simpleListWithNull, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArrayWithNull;
			compare = assertJSONArrayEquality;
		};
	}
	shared test
	void shouldConvertJSONArrayToList() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `List<Anything>`);
		assertEquals(result, testData.simpleListWithNull);
	}
	
	shared test
	void shouldConvertSetToJSONArray() {
		value result = convertx.convert(testData.simpleSet, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = assertJSONArrayEquality;
		};

	}
	shared test
	void shouldConvertJSONArrayToSet() {
		value result = convertx.convert(testData.simpleJSONArray, `Set<Object>`);
		assertEquals(result, testData.simpleSet);
	}
	shared test
	void shouldConvertArrayToJSONArray() {
		value result = convertx.convert(testData.simpleArrayWithNull, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArrayWithNull;
			compare = assertJSONArrayEquality;
		};
	}
	shared test
	void shouldConvertJSONArrayToArray() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `Array<Anything>`);
		assertEquals(result, testData.simpleArrayWithNull);
	}
	
	shared test
	void shouldConvertTupleToJSONArray() {
		value result = convertx.convert(testData.simpleTuple, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = assertJSONArrayEquality;
		};

	}
	shared test
	void shouldConvertJSONArrayToTuple() {
		value result = convertx.convert(testData.simpleJSONArray, `[String, Integer]`);
		assertEquals(result, testData.simpleTuple);
	}
}
