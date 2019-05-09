import ceylon.language.meta.model {
	Class,
	Type
}
import ceylon.test {
	test,
	assertEquals
}

import herd.gecon.core.api.transformer {
	Resolver,
	Delegator
}
import herd.gecon.core.engine {
	Gecon,
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
	
	shared actual Gecon gecon => Gecon{
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[`module herd.gecon.core.transformer`, `class SearchableCharacterListAndComparableStringToStringResolver`]
			);
		};
	};
	
	shared test
	void shouldConvertIntegerToSearchableCharacterListAndSumableToString() {
		assertEquals(gecon.transform(testData.matchingInteger, `SearchableList<Character>&Summable<String>`),
			testData.matchingString);
	}
}
