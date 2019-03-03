import ceylon.language.meta.model {
	Type
}

"Defines the convention of [[Mapping]]. When converting one object [[Source]] to another [[ResultType]], 
 it is required sometimes to define relation between parts of source and result. 
 This interface allows that, providing one to one mapping between those parts of source and result"
by("Wojceich Potiopa")
shared interface Mapping<in Source=Nothing,in ResultType=Nothing,out Key=Object,out Item=Anything> 
		given ResultType satisfies Type<> 
		given Key satisfies Object
		{
	shared class Error extends TransformationError {
		
		shared new (Anything source, Type<> resultType, Throwable? cause = null)
				extends TransformationError("Can't map ``source else "null"`` to ``resultType``", cause) {}
	
	}
	
	throws(`class Error`, "Whenever mapping cannot be complieateds")
	shared formal Map<Key,Item> map(Source source,ResultType resultType);
	
	
}