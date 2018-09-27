import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.operation {
	Convertion,
	Resolvance,
	Creation
}


shared interface Visitor {
	
	shared formal [Findable,Executable] prepareConverterRegistration<Source,Result,ResultType>
			(Convertion<Source,Result,ResultType> converter)
		given ResultType satisfies Type<Result>;
	shared formal [Findable,Executable] prepareResolverRegistration<Source,Result,ResultType>
			(Resolvance<Source,Result,ResultType> resolver)
			given ResultType satisfies Type<Result>
	;
	shared formal [Findable,Executable] prepareCreatorRegistration<Args,Result,ResultType>
			(Creation<Args,Result,ResultType> creator)
			given ResultType satisfies Result
	;
}
