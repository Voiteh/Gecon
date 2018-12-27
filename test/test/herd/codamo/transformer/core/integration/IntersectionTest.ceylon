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

class StringIntersectionResolver() satisfies Resolver<Anything,<MutableList<String>&SearchableList<String>>> {
	shared actual Class<MutableList<String>&SearchableList<String>,Nothing> resolve(Delegator delegator, Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => `ArrayList<String>`;
	
	shared actual Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher? matcher => object satisfies Resolvance<Anything,MutableList<String>&SearchableList<String>,Type<MutableList<String>&SearchableList<String>>>.Matcher {
		shared actual Integer priority => 1;
		shared actual Boolean match(Anything input, Type<MutableList<String>&SearchableList<String>> outputType) => true;
	};
}

shared class IntersectionTest() extends CoreIntegration() {
	
	shared actual Codamo codamo=>Codamo{ 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning(
				[`module herd.codamo.transformer.core`,`class StringIntersectionResolver`]
			);
					
		};
	};
	
	
	shared test
	void shouldConvertToIntersectionContainingType() {
		value result = codamo.convert(testData.matchingIntersection, `InteresectionModel`);
		assert (is InteresectionModel result);
		assert (result.data.containsEvery({ "1", "2", "3" }));
	}
}
