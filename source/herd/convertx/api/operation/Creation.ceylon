

import ceylon.language.meta.model {
	Class,
	Type
}

shared class CreationError extends OperationError{
	shared new (Type<Anything> type,Anything args=null, Throwable? cause = null)
			extends OperationError("Can't create ``type`` with arguments ``args else "null"``", cause) {}
}


shared sealed interface Creation<in Args=Nothing,out Result=Anything, in Kind=Nothing> satisfies Operation given Kind satisfies Result {
	
	throws(`class CreationError`)
	shared formal Result create(Delegator delegator,Class<Kind> kind, Args arguments);
	
	shared actual Anything flatten(Flatter visitor) => visitor.flattenCreator(this);
	
	shared interface Matcher {
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
}