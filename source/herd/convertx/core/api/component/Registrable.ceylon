import herd.convertx.core.internal {
	Findable,
	Flatten
}
shared interface Registrable{
	
	shared formal [Findable,Flatten] register(Visitor visitor);
	
}