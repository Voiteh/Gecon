import ceylon.collection {
	MutableList,
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	Type
}

import ceylon.test {
	test
}
import herd.codamo.api.operation {
	Resolvance,
	Delegator
}
import herd.codamo.api.provision {
	Provider
}
import herd.codamo.api.component {
	Resolver
}

class StringIntersectionResolver() satisfies Resolver<Anything,<MutableList<String>&SearchableList<String>>> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Delegator delegator, Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	shared actual Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher? matcher => object satisfies Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher {
		shared actual Integer priority => 1;
		shared actual Boolean match(Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => true;
	};
}
Provider intersectionProvider=object satisfies Provider {
	operations => { StringIntersectionResolver() };
	configurations => {};
};
shared class IntersectionTest() extends CoreIntegration([intersectionProvider]) {
	
	shared test
	void shouldConvertToIntersectionContainingType() {
		value result = convertx.convert(testData.matchingIntersection, `InteresectionModel`);
		assert (is InteresectionModel result);
		assert (result.data.containsEvery({ "1", "2", "3" }));
	}
}