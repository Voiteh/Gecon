import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.provision { Provider }
"Whenever there is [[Operation]] error one of subtypes will be thrown"
by("Wojciech Potiopa")
shared abstract class OperationError(String message, Throwable? cause = null) 
		of ConvertionError 
		| CreationError
		| ResolvanceError
		extends Exception(message, cause){}
"Base interface for whole operations executed by framework. Satisfiy one of subtypes and provide it via [[Provider]] to extend abilities of framework"
by("Wojciech Potiopa")
shared interface Operation of Convertion<> | Resolvance<> | Creation<> {
	"Used inside framework only"
	shared static interface Flatter {
		
		"Used inside framework only"
		shared formal Anything flattenConverter<Source,Result,ResultType>
				(Convertion<Source,Result,ResultType> converter)
				given ResultType satisfies Type<Result>;
		"Used inside framework only"
		shared formal Anything flattenResolver<Source,Result,ResultType>
				(Resolvance<Source,Result,ResultType> resolver)
				given ResultType satisfies Type<Result>;
		"Used inside framework only"
		shared formal Anything flattenCreator<Args,Result,ResultType>
				(Creation<Args,Result,ResultType> creator)
				given ResultType satisfies Result;
	}
	"Used inside framework only"
	shared formal Anything flatten(Flatter visitor);
	
	string => "``type(this).declaration.name``";
	
}
