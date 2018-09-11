import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.api.component {
	Resolver,
	wired
}
import herd.convertx.core.api {
	Context
}


shared wired class ResolvedTypeResolver() satisfies Resolver<Anything,Anything> {
	shared actual Class<Anything,Nothing> resolve(Context context, Anything input, Type<Anything> outputType) {
		assert (is Class<> outputType);
		return outputType;
	}
	
	matcher => object satisfies ResolvedTypeResolver.Matcher {
		
		shared actual Integer priority => runtime.maxIntegerValue;
		shared actual Boolean match(Anything input, Type<Anything> outputType) {
			if(is Class<> outputType,!outputType.declaration.abstract){
				return true;
			}
			return false;
		}
	};
}
