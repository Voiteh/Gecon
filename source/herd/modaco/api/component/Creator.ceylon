import ceylon.language.meta.model {
	Class
}



import herd.modaco.api.operation {
	Creation,
	CreationError,
	Delegator
}


shared interface Creator<Args,Result> satisfies  Creation<Args,Result,Result> {
	
	throws(`class CreationError`)
	shared formal actual Result create(Delegator delegator,Class<Result> kind, Args arguments);


}


