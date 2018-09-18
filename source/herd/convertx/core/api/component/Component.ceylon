import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface Component of
	TypedConverter<> | TypedResolver<> | TypedCreator<> satisfies Registrable{
	shared formal Executable toExecutable(Executable.Adapter visitor);
	shared formal Findable toFindable(Findable.Adapter visitor);
	
	
	//shared interface Visitor{
	//	shared formal Visitated converter<Source, ResultType, Result>(TypedConverter<Source, ResultType, Result> converter);
	//	shared formal Visitated resolver<Output, OutputType, Input>(TypedResolver<Output, OutputType, Input> resolver);
	//	shared formal Visitated creator<Result, Kind, Args>(TypedCreator<Result, Kind, Args> creator);
	//}
	//shared interface Visitated{
	//	shared formal Findable findable;
	//	shared formal Executable executable; 
	//}
	
	//shared formal Visitated visit(Visitor visitor);
}
