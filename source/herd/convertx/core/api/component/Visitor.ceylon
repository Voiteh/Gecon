import herd.convertx.core.internal {
	Findable,
	Executable
}
shared interface Visitor {
	
	shared formal [Findable,Executable] prepareConverterRegistration<Source,Result,ResultType>(TypedConverter<Source,Result,ResultType> converter);
	shared formal [Findable,Executable] prepareResolverRegistration<Source,Result,ResultType>(TypedResolver<Source,Result,ResultType> resolver);
	shared formal [Findable,Executable] prepareCreatorRegistration<Args,Result,ResultType>(TypedCreator<Args,Result,ResultType> creator);
}