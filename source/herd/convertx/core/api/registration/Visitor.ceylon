import herd.convertx.core.api.component {
	TypedCreator,
	TypedResolver,
	TypedConverter
}
import ceylon.language.meta.model {
	Type
}

shared interface Visitor {
	
	shared formal [Findable,Executable] prepareConverterRegistration<Source,Result,ResultType>
			(TypedConverter<Source,Result,ResultType> converter)
		given ResultType satisfies Type<Result>;
	shared formal [Findable,Executable] prepareResolverRegistration<Source,Result,ResultType>
			(TypedResolver<Source,Result,ResultType> resolver)
			given ResultType satisfies Type<Result>
	;
	shared formal [Findable,Executable] prepareCreatorRegistration<Args,Result,ResultType>
			(TypedCreator<Args,Result,ResultType> creator)
			given ResultType satisfies Result
	;
}
