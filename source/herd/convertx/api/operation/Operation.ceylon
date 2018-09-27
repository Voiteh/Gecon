import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type
}


shared abstract class OperationError(String message, Throwable? cause = null) 
		of ConvertionError 
		| CreationError
		| ResolvanceError
		extends Exception(message, cause){}

shared interface Operation of Convertion<> | Resolvance<> | Creation<> {
	
	shared static interface Flatter {
		
		shared formal Anything flattenConverter<Source,Result,ResultType>
				(Convertion<Source,Result,ResultType> converter)
				given ResultType satisfies Type<Result>;
		shared formal Anything flattenResolver<Source,Result,ResultType>
				(Resolvance<Source,Result,ResultType> resolver)
				given ResultType satisfies Type<Result>;
		shared formal Anything flattenCreator<Args,Result,ResultType>
				(Creation<Args,Result,ResultType> creator)
				given ResultType satisfies Result;
	}
	
	shared formal Anything flatten(Flatter visitor);
	
	string => "``type(this).declaration.name``";
	
}
