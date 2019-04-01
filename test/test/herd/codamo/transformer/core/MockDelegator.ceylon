import ceylon.language.meta.model {
	Type,
	Class
}
import herd.codamo.api.core.transformer {
	TransformationFindingError,
	Delegator,
	Relation
}
import herd.codamo.api.core.dictionary {
	Dictionary
}
shared class MockDelegator() satisfies Delegator{
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) { throw TransformationFindingError("Not found");}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) { throw TransformationFindingError("Not found");}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) { throw TransformationFindingError("Not found");}
	shared actual Dict map<Dict>(Relation<Anything,Anything> relation, Class<Dict,Nothing> relationType)
			given Dict satisfies Dictionary<Object,Anything> { throw TransformationFindingError("Not found");}
	
	
	
	
	
		
}