import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api.component {
	Resolver,
	Component
}
import ceylon.language.meta {
	type
}

service (`interface Component`)
shared class SelfResolver() satisfies Resolver<Anything,Anything> {
	shared actual Class<Anything,Nothing> resolve(Anything input,ClassOrInterface<Anything> outputType) {
		assert (is Class<> type = outputType);
		return type;
	}
	
	matcher => object satisfies SelfResolver.Matcher {
		
		shared actual Integer priority => 0;
		shared actual Boolean match(Anything inputType, ClassOrInterface<Anything> outputType) {
			if (is Class<> outputType) {
				return true;
			}
			return false;
		}
	};
}
