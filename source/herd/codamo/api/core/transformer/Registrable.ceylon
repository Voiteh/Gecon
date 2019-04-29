import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.dictionary {
	Dictionary
}
shared interface Registrable {
	
	shared static
	interface Adapter {
		
		
		shared formal Anything convertion<Source,Result,ResultType>(
			Conversion<Source, Result, ResultType> convertion,
			Matchable<Source,ResultType>? matchable ) given ResultType satisfies Type<Result>;
		
		shared formal Anything resolvance<Source,Result,ResultType>(
			Resolvance<Source, Result, ResultType> resolvance,
			Matchable<Source,ResultType>? matchable ) given ResultType satisfies Type<Result>;
		
		
		shared formal Anything creation<Source,Result,ResultType>(
			Creation<Source, Result, ResultType> creation,
			Matchable<Source,Class<ResultType>>? matchable ) given ResultType satisfies Result;
		
		shared formal Anything mapping<Source,Result,Dict>(
			Mapping<Source,Result,Dict> mapping,
			Matchable<Relation<Source,Result>,Class<Dict>>? matchable) 
				given Source satisfies Object
				given Dict satisfies Dictionary<Object,Anything>
		;
		
	}
	"Used inside framework only"
	shared formal Anything visitAdapter(Adapter visitor);
}
