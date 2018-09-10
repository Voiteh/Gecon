import ceylon.language.meta.model {
	Type,
	Attribute
}

"Exception returned whenever one aspect of adaptation process fails"
shared abstract class ConvertxException(String message, Throwable? cause = null) 
		of AttributeMappingException
		|ConvertionException 
		|ResolvanceException 
		|CreationException 
		|ComponentFindingException
		extends Exception(message, cause) {}
shared class CreationException extends ConvertxException {
	shared new (Type<Anything> type,Anything args=null, Throwable? cause = null)
			extends ConvertxException("Can't create ``type`` with arguments ``args else "null"``", cause) {}
}
shared class ResolvanceException extends ConvertxException {
	shared new (Type<Anything> provisioningType, Throwable? cause = null)
			extends ConvertxException("Can't resolve concrete type, for ``provisioningType`` type", cause) {
	}
}

shared class ConvertionException extends ConvertxException {
	shared new (Anything source, Type<Anything> destinationType, Throwable? cause = null)
			extends ConvertxException("Can't adapt ``source else "null"`` to ``destinationType``", cause) {}
}
shared class AttributeMappingException extends ConvertxException{
	
	shared new(Attribute<Nothing, Anything, Nothing> destAttribute,Type<> sourceType,Throwable? cause=null)
			extends ConvertxException("Can't find matching attribute in ``sourceType`` for ``destAttribute``",cause){}
	
}

shared class ComponentFindingException(String message) extends ConvertxException(message){}
