import herd.codamo.api.core.transformer {
	Delegator,
	TransformationFindingError
}
import ceylon.language.meta.model {
	Type,
	Class
}
shared class MockDelagator() satisfies Delegator {
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) { throw TransformationFindingError("Not found");}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) { throw TransformationFindingError("Not found");}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) { throw TransformationFindingError("Not found");}
	shared actual Map<Object,Anything> map(Anything source, Type<Anything> resultType) {throw TransformationFindingError("Not found");}
	
	
	
}