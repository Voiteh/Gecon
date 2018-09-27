import ceylon.language.meta.model {
	Class
}


import herd.convertx.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.convertx.api.component {
	Creator
}

import herd.convertx.core.component {
	AnyTuple
}

wired
shared class TupleCreator() satisfies  Creator<{Anything*},AnyTuple> {
	shared actual AnyTuple create(Delegator delegator,Class<AnyTuple> kind, {Anything*} arguments) {
		value first = arguments.first;
		assert (exists elementType = kind.typeArgumentList.first);
		if (arguments.rest.empty) {
			return kind.apply(first, empty);
		} else {
			assert (is Class<AnyTuple> subTupleType = kind.typeArgumentList.rest.rest.first);
			value subTuple = create(delegator,subTupleType, arguments.rest);
			return kind.apply(first, subTuple);
		}
	}
	
	shared actual Creation<{Anything*},AnyTuple,AnyTuple>.Matcher? matcher => object satisfies Creation<{Anything*},AnyTuple,AnyTuple>.Matcher{
		shared actual Boolean match(Class<AnyTuple> kind, {Anything*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
