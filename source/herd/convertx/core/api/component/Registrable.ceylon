import herd.convertx.core.internal {
	Findable,
	Executable
}
shared interface Registrable{
	
	shared formal [Findable,Executable] register(Visitor visitor);
	
}