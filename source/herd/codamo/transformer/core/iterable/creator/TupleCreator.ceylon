import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
import herd.codamo.transformer.core.iterable {
	AnyTuple
}



"Creator for [[Tuple]] using any iterable as arguments, uses recurence for creating subtuple's"
tagged("Generic")
by("Wojciech Potiopa")
shared class TupleCreator() extends Creator<{Anything*},AnyTuple>() {
	shared actual AnyTuple create(Delegator delegator, {Anything*} arguments,Class<AnyTuple> kind) {
		value first = arguments.first;
		assert (exists elementType = kind.typeArgumentList.first);
		if (arguments.rest.empty) {
			return kind.apply(first, empty);
		} else {
			assert (is Class<AnyTuple> subTupleType = kind.typeArgumentList.rest.rest.first);
			value subTuple = create(delegator, arguments.rest,subTupleType);
			return kind.apply(first, subTuple);
		}
	}
	
	matchable=> object satisfies Matchable<{Anything*},Class<AnyTuple>>{
		shared actual Boolean predicate({Anything*} source, Class<AnyTuple,Nothing> resultType) => true;
		
		shared actual Integer priority =1;
		
	};
	
}
