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
	Matchable
}
import herd.codamo.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}


class SearchableCharacterListAndComparableStringToStringResolver() extends Resolver<Anything,SearchableList<Character>&Summable<String>,Type<SearchableList<Character>&Summable<String>>>() {
	shared actual Class<SearchableList<Character>&Summable<String>,Nothing> resolve(Delegator delegator, Anything input, Type<SearchableList<Character>&Summable<String>> outputType) => `String`;
	
	matchable=> object satisfies Matchable<Anything,Type<SearchableList<Character>&Summable<String>>>{
		shared actual Boolean predicate(Anything source, Type<SearchableList<Character>&Summable<String>> resultType) => true;
		
		shared actual Integer priority =0;
		
		
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
