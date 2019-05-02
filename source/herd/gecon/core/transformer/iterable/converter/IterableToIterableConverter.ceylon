import ceylon.language.meta.model {
	ClassOrInterface,
	Interface
}

import herd.gecon.core.api.transformer {
	Converter,
	Delegator
}
import herd.gecon.core.api.util {
	runtimeCall
}
import herd.type.support {
	flat
}

"Converts one generic [[Iterable]] to another. Uses matcher for matching for finding if this converter is applicable."
by ("Wojciech Potiopa")
shared class IterableToIterableConverter() extends Converter<{Anything*},{Anything*},ClassOrInterface<{Anything*}>>() {
	shared actual {Anything*} convert(Delegator delegator, {Anything*} source, ClassOrInterface<{Anything*}> resultType) {
		assert (exists explictIterableType = flat.types(resultType)
				.narrow<Interface<>>()
				.find((Interface<> element) => element.declaration == `interface Iterable`));
		assert (exists elementType = explictIterableType.typeArgumentList.first);
		value args = source.collect((Anything element) => delegator.convert(element, elementType)).sequence();
		value narrowedArgs = runtimeCall.iterable.narrow(args, elementType);
		value resolvedType = delegator.resolve(args, resultType);
		return delegator.create(resolvedType, narrowedArgs);
	}
	
	shared actual Matcher matcher => Matcher{
		predicate({Anything*} source, ClassOrInterface<{Anything*}> resultType) => true;
		priority = 1;
	};
}
