import herd.convertx.core.api.component {
	wired,
	Resolver
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta {
	type
}

wired
shared class AnythingResolver() satisfies Resolver<Anything,Anything> {
	shared actual Class<Anything,Nothing> resolve(Context context, Anything input, Type<Anything> outputType) {
		
		switch (input)
		case (is Object) {
			assert (is Class<> inputType = type(input));
			if (inputType.declaration.abstract) {
				return `Object`;
			}
			return inputType;
		}
		case (is Null) {
			return `Null`;
		}
	}
	matcher => object satisfies AnythingResolver.Matcher {
		shared actual Boolean match(Anything input, Type<Anything> outputType) => outputType == `Anything`;
		
		shared actual Integer priority => 0;
	};
}
