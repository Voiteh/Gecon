import ceylon.language.meta.model {
	Type,
	Class
}


import herd.convertx.api.operation {
	Delegator,
	ComponentFindingException
}
shared class MockContext() satisfies Delegator{
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingException("Not found");}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) { throw ComponentFindingException("Not found");}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingException("Not found");}
	
	
}