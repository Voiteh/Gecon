import herd.convertx.core.api.component {
	Component,
	TypedResolver
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	IntersectionType
}
import herd.convertx.core.api {
	Context,
	Provider
}
import ceylon.test {
	test
}

class StringIntersectionResolver() satisfies TypedResolver<MutableList<String>&SearchableList<String>,IntersectionType<MutableList<String>&SearchableList<String>>,Anything> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Context context, Anything input, IntersectionType<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	matcher => object satisfies StringIntersectionResolver.Matcher {
		shared actual Boolean match(Anything input, IntersectionType<MutableList<String>&SearchableList<String>> outputType) => true;
		
		shared actual Integer priority => 1;
	};
}

shared class IntersectionTest() extends BaseTest() {
	
	additionalProviders => { object satisfies Provider {
			shared actual MutableList<Component> components => ArrayList<Component> {
				elements = { StringIntersectionResolver() };
			};
	}};
	
	shared test
	void shouldConvertToIntersectionContainingType() {
		assert (is InteresectionModel result = convertx.convert(testData.matchingIntersection, `InteresectionModel`));
		assert (result.data.containsEvery({ "1", "2", "3" }));
	}
}
