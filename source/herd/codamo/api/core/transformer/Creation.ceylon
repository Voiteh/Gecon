

import ceylon.language.meta.model {
	Class,
	Type
}

"Thrown whever there is [[Creation]] error"
by("Wojciech Potiopa")
shared class CreationError extends TransformationError{
	shared new (Type<Anything> type,Anything args=null, Throwable? cause = null)
			extends TransformationError("Can't create ``type`` with arguments ``args else "null"``", cause) {}
}

"Base interface for recreating data model, used as support [[Transformation]]"
by("Wojciech Potiopa")
shared sealed interface Creation<in Args=Nothing,out Result=Anything, in Kind=Nothing> satisfies Transformation given Kind satisfies Result {
	
	"Creates data model for provided [[kind]] using [[arguments]]. This works as a kind of a constructor"
	throws(`class CreationError`)
	shared formal Result create(
		"Delegates to other [[Transformation]] if possible"
		Delegator delegator,
		"Creates provided [[Kind]]"
		Class<Kind> kind,
		"Arguments to be used for creation"
		 Args arguments);
	
	"Used inside framework only"
	shared actual Anything flatten(Flatter visitor) => visitor.flattenCreator(this);
	
	
	"Allows matching for generic [[Transformation]]s which are not hashable by their definition. This API may change."
	by("Wojciech Potiopa")
	shared interface Matcher {
		"Checks wheter given arguments for [[Creation]] will be applicable"
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		"Priority of this [[Creation]], whenever found [[Creation]] with higher [[priority]], it will be selected for execution."
		shared formal Integer priority;
	}
	"Refinable if matcher required for given [[Creation]]"
	shared default Matcher? matcher=>null;
}