import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.operation {
	OperationError,
	Delegator,
	ComponentFindingError
}


"Main entry point for accessing convertion API for Codamo"
by("Wojciech Potiopa")
shared class Codamo{
	
	"Delegates operations to components"
	Delegator delegator;
	
	"Default constructor, requires [[delegator]] to handle converiton calls. 
	 This can be used with [[Delegator]] provided by [[`module herd.codamo.core`]], 
	 or any other, user defined delegator (only for testing and tinkering purposes)"
	shared new (
		"Handles delegation of convertion"
		Delegator delegator){
		this.delegator=delegator;
	}
	
	"API for converting specific [[source]] data into [[resultType]] type.
	 This method handles errors the same way as positive results."
	shared Result|OperationError|ComponentFindingError convert<Result>(
		"User input of converted data"
		Anything source,
		"Result type to which convertion will be executed"
		Type<Result> resultType){
		try {
			value result =delegator.convert(source, resultType);
			return result;
		} catch (OperationError|ComponentFindingError x) {
			return x;
		}
	}
	
}

