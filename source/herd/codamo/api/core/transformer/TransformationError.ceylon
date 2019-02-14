"Whenever there is  error one of subtypes will be thrown"
by("Wojciech Potiopa")
shared abstract class TransformationError(String message, Throwable? cause = null) 
		of ConvertionError 
		| CreationError
		| ResolvanceError
		extends Exception(message, cause){}