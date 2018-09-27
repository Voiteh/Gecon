import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.operation {
	OperationError,
	Delegator,
	ComponentFindingError
}
shared class Codamo{
	
	Delegator delegator;
	
	shared new (Delegator delegator){
		this.delegator=delegator;
	}
	
	
	shared Result|OperationError|ComponentFindingError convert<Result>(Anything source, Type<Result> resultType){
		try {
			value result =delegator.convert(source, resultType);
			return result;
		} catch (OperationError|ComponentFindingError x) {
			return x;
		}
	}
	
}

