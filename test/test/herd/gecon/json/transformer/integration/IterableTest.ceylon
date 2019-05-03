import ceylon.test {
	test,
	assertEquals,
	ignore
}
import test.herd.gecon.json.transformer.integration.data {
	testData
}
import ceylon.json {
	JsonArray,
	Value
}

shared class IterableTest() extends JsonIntegration() {
	
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
	void shouldConvertStreamToJsonArray() {
		value result = gecon.convert(testData.simpleStream, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArray;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	
	shared test
	void shouldConvertJsonArrayToStream() {
		value result = gecon.convert(testData.simpleJsonArray, `{String|Integer|Null*}`);
		assertEquals {
			actual = result;
			expected = testData.simpleStream;
			compare = checkIterableEquality<{String|Integer|Null*},String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertSequenceToJsonArray() {
		value result = gecon.convert(testData.simpleSequence, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArray;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	
	shared test
	void shouldConvertJsonArrayToSequence() {
		value result = gecon.convert(testData.simpleJsonArray, `[String|Integer|Null*]`);
		assertEquals {
			actual = result;
			expected = testData.simpleSequence;
			compare = checkIterableEquality<[String|Integer|Null*],String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertListToJsonArray() {
		value result = gecon.convert(testData.simpleListWithNull, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArrayWithNull;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	shared test
	void shouldConvertJsonArrayToList() {
		value result = gecon.convert(testData.simpleJsonArrayWithNull, `List<String|Integer|Null>`);
		assertEquals {
			actual = result;
			expected = testData.simpleListWithNull;
			compare = checkIterableEquality<List<String|Integer|Null>,String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertSetToJsonArray() {
		value result = gecon.convert(testData.simpleSet, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArray;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	shared test
	void shouldConvertJsonArrayToSet() {
		value result = gecon.convert(testData.simpleJsonArray, `Set<String|Integer>`);
		assertEquals {
			actual = result;
			expected = testData.simpleSet;
			compare = checkIterableEquality<Set<String|Integer>,String|Integer>;
		};
	}
	shared test
	void shouldConvertArrayToJsonArray() {
		value result = gecon.convert(testData.simpleArrayWithNull, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArrayWithNull;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	shared ignore ("Failing because of https://github.com/eclipse/ceylon/issues/7390")
	test
	void shouldConvertJsonArrayToArray() {
		value result = gecon.convert(testData.simpleJsonArrayWithNull, `Array<String|Integer|Null>`);
		assertEquals {
			actual = result;
			expected = testData.simpleArrayWithNull;
			compare = checkIterableEquality<Array<String|Integer|Null>,String|Integer|Null>;
		};
	}
	
	shared test
	void shouldConvertTupleToJsonArray() {
		value result = gecon.convert(testData.simpleTuple, `JsonArray`);
		assertEquals {
			actual = result;
			expected = testData.simpleJsonArray;
			compare = checkIterableEquality<JsonArray,Value>;
		};
	}
	shared test
	void shouldConvertJsonArrayToTuple() {
		value result = gecon.convert(testData.simpleJsonArray, `[String, Integer]`);
		assertEquals(result, testData.simpleTuple);
	}
}
