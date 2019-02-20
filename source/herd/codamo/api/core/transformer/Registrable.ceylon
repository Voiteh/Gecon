import ceylon.language.meta.model {
	Type
}
shared interface Registrable {
	
	
	shared static interface Adapter {
		
		"Allows engine to map registered transformation into requested type"
		shared formal Anything adapt<Source,Result,ResultType>(
			"Transformation to be adapted"
			Convertion<Source,Result,ResultType>|
					Resolvance<Source,Result,ResultType>|
					Creation<Source,Result,Result> 
					transformation,
			"possible matcher "
			Matchable<Source,ResultType>? matcher) given ResultType satisfies Object;
		
		
	}
	"Used inside framework only"
	shared formal Anything visitAdapter(Adapter visitor);
	
		
	
	
}