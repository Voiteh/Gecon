import ceylon.language.meta.model {
	Class,
	Type
}
shared interface Registrable {
	
	shared static
	interface Adapter {
		
		
		shared formal Anything convertion<Source,Result,ResultType>(
			Convertion<Source, Result, ResultType> convertion,
			Matchable<Source,ResultType>? matchable ) given ResultType satisfies Type<Result>;
		
		shared formal Anything resolvance<Source,Result,ResultType>(
			Resolvance<Source, Result, ResultType> resolvance,
			Matchable<Source,ResultType>? matchable ) given ResultType satisfies Type<Result>;
		
		
		shared formal Anything creation<Source,Result,ResultType>(
			Creation<Source, Result, ResultType> creation,
			Matchable<Source,Class<ResultType>>? matchable ) given ResultType satisfies Result;
		
		shared formal Anything mapping<Source,ResultType,Key,Item>(
			Mapping<Source,ResultType,Key,Item> mapping,
			Matchable<Source,ResultType>? matchable) 
				given ResultType satisfies Type<>
				given Key satisfies Object
				;
		
	}
	"Used inside framework only"
	shared formal Anything visitAdapter(Adapter visitor);
}
