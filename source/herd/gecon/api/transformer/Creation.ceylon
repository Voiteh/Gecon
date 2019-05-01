import ceylon.language.meta.model {
	Class,
	Type
}


"Base interface for recreating data model, used as support transformation"
by ("Wojciech Potiopa")
shared interface Creation<in Args=Nothing, out Result=Anything, in ResultType=Nothing> given ResultType satisfies Result {
	
	"Thrown whever there is [[Creation]] error"
	shared class Error extends TransformationError {
		shared new (Type<Anything> type, Anything args = null, Throwable? cause = null)
				extends TransformationError("Can't create ``type`` with arguments `` args else "null" ``", cause) {}
	}
	
	"Creates data model for provided [[kind]] using [[arguments]]. This works as a kind of a constructor"
	throws (`class Error`)
	shared formal Result create(
		"Delegates to other transformation if possible"
		Delegator delegator,
		"Arguments to be used for creation"
		Args arguments,
		"Creates provided [[ResultType]]"
		Class<ResultType> kind);
}
