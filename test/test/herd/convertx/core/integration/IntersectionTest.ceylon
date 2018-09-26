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

class StringIntersectionResolver() satisfies Resolver<Anything,MutableList<String>&SearchableList<String>> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Context context, Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	shared actual StringIntersectionResolver.Matcher matcher => object satisfies StringIntersectionResolver.Matcher {
		shared actual Boolean match(Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => true;
		
		shared actual Integer priority => 1;
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
