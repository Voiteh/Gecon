import herd.gecon.core.api.transformer {
	Delegator,
	TransformationFindingError,
	Relation
}
import ceylon.language.meta.model {
	Type,
	Class
}
import herd.gecon.core.api.dictionary {
	Dictionary
}

shared class MockDelagator() satisfies Delegator {
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		throw TransformationFindingError("Not found");
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		throw TransformationFindingError("Not found");
	}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
		throw TransformationFindingError("Not found");
	}
	shared actual Dict map<Dict>(Relation<Anything,Anything> relation, Class<Dict,Nothing> relationType)
			given Dict satisfies Dictionary<Object,Anything> {
		throw TransformationFindingError("Not found");
	}
}
