import ceylon.collection {
	MutableList,
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	Context,
	Provider,
	Resolver
}
import ceylon.test {
	test
}
import herd.convertx.api.operation {
	Resolvance
}

class StringIntersectionResolver() satisfies Resolver<Anything,<MutableList<String>&SearchableList<String>>> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Context context, Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	shared actual Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher? matcher => object satisfies Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher {
		shared actual Integer priority => 1;
		shared actual Boolean match(Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => true;
	};
}

shared class IntersectionTest() extends BaseTest() {
	
	providers => super.providers.follow(object satisfies Provider {
			components => { StringIntersectionResolver() };
			configurations => {};
		}).sequence();
	
	shared test
	void shouldConvertToIntersectionContainingType() {
		value result = convertx.convert(testData.matchingIntersection, `InteresectionModel`);
		assert (is InteresectionModel result);
		assert (result.data.containsEvery({ "1", "2", "3" }));
	}
}
