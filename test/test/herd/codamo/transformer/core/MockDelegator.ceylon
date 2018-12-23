import ceylon.language.meta.model {
	Type,
	Class
}
import herd.codamo.api.core.transformer {
	ComponentFindingError,
	Delegator
}
shared class MockDelegator() satisfies Delegator{
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingError("Not found");}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) { throw ComponentFindingError("Not found");}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingError("Not found");}
	
	
}