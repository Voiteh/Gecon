import herd.convertx.core.internal {
	Executable,
	Findable
}
shared interface Component of TypedConverter<> 
		| TypedResolver<> 
		| TypedCreator<Anything,Nothing,Nothing> 
		| TypedDescriptor<Nothing,Nothing> {
	shared formal Executable toExecutable(Executable.Adapter visitor);
	shared formal Findable toFindable(Findable.Adapter visitor);
}


