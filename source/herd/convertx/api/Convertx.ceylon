import ceylon.language.meta.model {
	Type
}


import herd.convertx.api.operation {
	OperationError,
	Delegator,
	ComponentFindingException
}
shared class Convertx{
	
	Delegator delegator;
	
	shared new (Delegator delegator){
		this.delegator=delegator;
	}
	
	
	shared Result|OperationError|ComponentFindingException convert<Result>(Anything source, Type<Result> resultType){
		try {
			value result =delegator.convert(source, resultType);
			return result;
		} catch (OperationError|ComponentFindingException x) {
			return x;
		}
	}
}

