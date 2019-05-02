import ceylon.language.meta.model {
	Type,
	Class
}
import herd.gecon.core.api.dictionary {
	Dictionary
}

"Defines the convention of [[Mapping]]. When converting one object [[Source]] to another [[ResultType]], 
 it is required sometimes to define relation between parts of source and result. 
 This interface allows that, providing one to one mapping between those parts of source and result"
by ("Wojceich Potiopa")
shared interface Mapping<in Source=Nothing, in ResultType=Nothing, out TheDictionary=Dictionary<Object,Anything>>
		given TheDictionary satisfies Map<Object,Anything>
		given Source satisfies Object {
	
	throws (`class Error`, "Whenever mapping cannot be complieateds")
	shared formal TheDictionary map(Relation<Source,ResultType> relation);
	
	shared class Error extends TransformationError {
		
		shared new (Anything source, Type<> resultType, Throwable? cause = null)
				extends TransformationError("Can't map `` source else "null" `` to ``resultType``", cause) {}
	}
}

by ("Wojciech Potiopa")
shared class Relation<out Source=Anything, out Result=Anything>(
	shared Source source,
	shared Class<Result> resultClass) {
	
	string => "Relation of ``source else "null" `` -> ``resultClass``";
	
}
