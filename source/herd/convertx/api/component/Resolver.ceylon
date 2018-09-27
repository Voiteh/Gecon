import ceylon.language.meta.model {
	Class,
	Type
}

import herd.convertx.api.operation {
	Resolvance,
	ResolvanceError,
	Delegator
}

shared interface Resolver<Source, Result> satisfies Resolvance<Source,Result,Type<Result>> {
	
	throws (`class ResolvanceError`)
	shared formal actual Class<Result> resolve(Delegator delegator, Source source, Type<Result> resultType);

	
}
