import ceylon.language.meta.model {
	Type
}

import herd.gecon.api.dictionary {
	Dictionary
}

shared interface Registrable {
	
	shared static
	interface Adapter {
		
		shared formal Anything conversion<Source, Result, ResultType>(
			Converter<Source,Result,ResultType> conversion) given ResultType satisfies Type<Result>;
		
		shared formal Anything resolvance<Source, Result, ResultType>(
			Resolver<Source,Result,ResultType> resolvance) given ResultType satisfies Type<Result>;
		
		shared formal Anything creation<Source, Result>(
			Creator<Source,Result> creation);
		
		shared formal Anything mapping<Source, Result, Dict>(
			Mapper<Source,Result,Dict> mapper)
				given Source satisfies Object
				given Dict satisfies Dictionary<Object,Anything>;
	}
	"Used inside framework only"
	shared formal Anything visitAdapter(Adapter visitor);
}
