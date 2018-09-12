import ceylon.test {
	test,
	assertEquals,
	ignore
}
import herd.convertx.json {
	JSONArray,
	JSONValue
}
import test.herd.convertx.json.integration.data {
	testData
}

shared class IterableTest() extends BaseJsonIntegrationTest() {
	
	Boolean checkIterableEquality<Type,Item>(Anything result, Anything target) 
			given Type satisfies {Item*} {
		if (is Type result, is Type target) {
			for (Integer->Item indexed in target.indexed) {
				Item indexedItem = indexed.item;
				Item? get = result.getFromFirst(indexed.key);
				Boolean bothNotExists = !indexedItem exists && !get exists;
				Boolean bothExists = indexedItem exists && get exists;
				Boolean andResult = bothExists || bothNotExists;
				if (!andResult) {
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
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	
	shared test
	void shouldConvertJSONArrayToStream() {
		value result = convertx.convert(testData.simpleJSONArray, `{String|Integer|Null*}`);
		assertEquals {
			actual = result;
			expected = testData.simpleStream;
			compare = checkIterableEquality<{String|Integer|Null*},String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertSequenceToJSONArray() {
		value result = convertx.convert(testData.simpleSequence, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	
	shared test
	void shouldConvertJSONArrayToSequence() {
		value result = convertx.convert(testData.simpleJSONArray, `[String|Integer|Null*]`);
		assertEquals {
			actual = result;
			expected = testData.simpleSequence;
			compare = checkIterableEquality<[String|Integer|Null*],String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertListToJSONArray() {
		value result = convertx.convert(testData.simpleListWithNull, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArrayWithNull;
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	shared test
	void shouldConvertJSONArrayToList() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `List<String|Integer|Null>`);
		assertEquals {
			actual = result;
			expected = testData.simpleListWithNull;
			compare = checkIterableEquality<List<String|Integer|Null>,String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertSetToJSONArray() {
		value result = convertx.convert(testData.simpleSet, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	shared test
	void shouldConvertJSONArrayToSet() {
		value result = convertx.convert(testData.simpleJSONArray, `Set<String|Integer>`);
		assertEquals {
			actual = result;
			expected = testData.simpleSet;
			compare = checkIterableEquality<Set<String|Integer>,String|Integer>;
		};
	}
	shared test
	void shouldConvertArrayToJSONArray() {
		value result = convertx.convert(testData.simpleArrayWithNull, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArrayWithNull;
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	shared ignore ("Failing because of https://github.com/eclipse/ceylon/issues/7390")
	test
	void shouldConvertJSONArrayToArray() {
		value result = convertx.convert(testData.simpleJSONArrayWithNull, `Array<String|Integer|Null>`);
		assertEquals {
			actual = result;
			expected = testData.simpleArrayWithNull;
			compare = checkIterableEquality<Array<String|Integer|Null>,String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertTupleToJSONArray() {
		value result = convertx.convert(testData.simpleTuple, `JSONArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJSONArray;
			compare = checkIterableEquality<JSONArray,JSONValue>;
		};
	}
	shared test
	void shouldConvertJSONArrayToTuple() {
		value result = convertx.convert(testData.simpleJSONArray, `[String, Integer]`);
		assertEquals(result, testData.simpleTuple);
	}
}
