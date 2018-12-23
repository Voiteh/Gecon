import ceylon.language.meta.model {
	Type
}


"Resolves provided type into class. This is support API only needed for resolvance"
by("Wojciech Potiopa")
shared interface Resolver<Source, Result> satisfies Resolvance<Source,Result,Type<Result>> {	
}
