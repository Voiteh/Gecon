import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import herd.convertx.core.api {
	Context,
	AnyTuple
}

wired
shared class TupleCreator() satisfies  Creator<{Anything*},AnyTuple> {
	shared actual AnyTuple create(Context context,Class<AnyTuple> kind, {Anything*} arguments) {
		value first = arguments.first;
		assert (exists elementType = kind.typeArgumentList.first);
		if (arguments.rest.empty) {
			return kind.apply(first, empty);
		} else {
			assert (is Class<AnyTuple> subTupleType = kind.typeArgumentList.rest.rest.first);
			value subTuple = create(context,subTupleType, arguments.rest);
			return kind.apply(first, subTuple);
		}
	}
	matcher => object satisfies TupleCreator.Matcher {
		shared actual Boolean match(Class<AnyTuple> kind, {Anything*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
