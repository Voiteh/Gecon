import herd.convertx.core.api.logicals {
	Visitor,
	Findable,
	Executable
}

shared interface Registrable{
	
	shared formal [Findable,Executable] register(Visitor visitor);
	
}