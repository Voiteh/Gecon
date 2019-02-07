import ceylon.language.meta.model {
	Class,
	Type
}

import ceylon.test {
	test,
	assertEquals
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Resolvance
}

import herd.codamo.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}


class SearchableCharacterListAndComparableStringToStringResolver() satisfies Resolver<Anything,SearchableList<Character>&Summable<String>> {
	shared actual Class<SearchableList<Character>&Summable<String>,Nothing> resolve(Delegator delegator, Anything input, Type<SearchableList<Character>&Summable<String>> outputType) => `String`;
	
	shared actual Resolvance<Anything,SearchableList<Character>&Summable<String>,Type<SearchableList<Character>&Summable<String>>>.Matcher? matcher => object satisfies Resolvance<Anything,SearchableList<Character>&Summable<String>,Type<SearchableList<Character>&Summable<String>>>.Matcher{
		shared actual Boolean match(Anything input, Type<SearchableList<Character>&Summable<String>> outputType) => true;
		
		shared actual Integer priority => 0;
		
		
	};

}

shared class IntersectionTest() extends CoreIntegration() {
	
	shared actual Codamo codamo => Codamo {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[`module herd.codamo.transformer.core`, `class SearchableCharacterListAndComparableStringToStringResolver`]
			);
		};
	};
	
	shared test
	void shouldConvertIntegerToSearchableCharacterListAndSumableToString() {
		assertEquals(codamo.convert(testData.matchingInteger, `SearchableList<Character>&Summable<String>`),
			testData.matchingString);
	}
}
