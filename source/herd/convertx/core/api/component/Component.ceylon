import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface Component of
	TypedConverter<> | TypedResolver<> | TypedCreator<> satisfies Registrable{
	shared formal Executable toExecutable(Executable.Adapter visitor);
	shared formal Findable toFindable(Findable.Adapter visitor);
	
}
