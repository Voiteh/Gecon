import ceylon.language.meta.model {
	Class,
	Type
}
import ceylon.test {
	test,
	assertEquals
}

import herd.gecon.api.transformer {
	Resolver,
	Delegator
}
import herd.gecon.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}


class SearchableCharacterListAndComparableStringToStringResolver() extends Resolver<Anything,SearchableList<Character>&Summable<String>,Type<SearchableList<Character>&Summable<String>>>() {
	shared actual Class<SearchableList<Character>&Summable<String>,Nothing> resolve(Delegator delegator, Anything input, Type<SearchableList<Character>&Summable<String>> outputType) => `String`;
	
	matcher=> Matcher{
		Boolean predicate(Anything source, Type<SearchableList<Character>&Summable<String>> resultType) => true;
		Integer priority =0;
	};
	

}

shared class IntersectionTest() extends CoreIntegration() {
	
	shared actual Codamo codamo => Codamo {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[`module herd.gecon.transformer.core`, `class SearchableCharacterListAndComparableStringToStringResolver`]
			);
		};
	};
	
	shared test
	void shouldConvertIntegerToSearchableCharacterListAndSumableToString() {
		assertEquals(codamo.convert(testData.matchingInteger, `SearchableList<Character>&Summable<String>`),
			testData.matchingString);
	}
}
