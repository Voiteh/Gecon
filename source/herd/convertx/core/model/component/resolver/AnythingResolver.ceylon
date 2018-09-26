
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	Context,
	Resolver,
	wired
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.operation {
	Resolvance
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
	shared actual Resolvance<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Resolvance<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything input, Type<Anything> outputType) => outputType == `Anything`;
		
		shared actual Integer priority => 0;

	};
	
}
