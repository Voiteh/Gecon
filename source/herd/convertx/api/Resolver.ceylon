import ceylon.language.meta.model {
	Class,
	Type
}



import herd.convertx.api.operation {
	Resolvance
}
shared interface Resolver<Source, Result> satisfies Resolvance<Source,Result,Type<Result>> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Result> resolve(Context context, Source source, Type<Result> resultType);

	shared actual default Resolver<Source, Result>.Matcher? matcher => null;
	
}
