import herd.convertx.core.internal {
	Findable,
	Flatten
}
shared interface Visitor {
	
	shared formal [Findable,Flatten] prepareConverterRegistration<Source,Result,ResultType>(TypedConverter<Source,Result,ResultType> converter);
	shared formal [Findable,Flatten] prepareResolverRegistration<Source,Result,ResultType>(TypedResolver<Source,Result,ResultType> resolver);
	shared formal [Findable,Flatten] prepareCreatorRegistration<Args,Result,ResultType>(TypedCreator<Args,Result,ResultType> creator);
}