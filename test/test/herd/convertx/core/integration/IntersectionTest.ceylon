import herd.convertx.core.api.component {
	Component,
	Resolver
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.api {
	Context,
	Provider
}
import ceylon.test {
	test
}
import ceylon.logging {
	trace
}
import herd.convertx.core {
	logger
}

class StringIntersectionResolver() satisfies Resolver<MutableList<String>&SearchableList<String>,Anything> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Context context, Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	matcher => object satisfies StringIntersectionResolver.Matcher {
		shared actual Boolean match(Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => true;
		
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
		logger.priority=trace;
		value result = convertx.convert(testData.matchingIntersection, `InteresectionModel`);
		assert (is InteresectionModel result);
		assert (result.data.containsEvery({ "1", "2", "3" }));
	}
}
