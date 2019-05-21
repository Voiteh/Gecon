import herd.gecon.core.api.dictionary {
	Dictionary
}
"Whenever there is error one of subtypes will be thrown"
by("Wojciech Potiopa")
shared abstract class TransformationError(String message, Throwable? cause = null) 
		of Conversion<Nothing,Anything,Nothing>.Error|
		Resolvance<Nothing,Anything,Nothing>.Error| 
		Creation<Nothing,Anything,Nothing>.Error |
		Mapping<Nothing,Nothing,Dictionary<Object,Anything>>.Error
		extends Exception(message, cause){}