import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.codamo.api.core.util {
	typeHierarchy,
	runtimeCall
}
import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Convertion,
	Delegator
}

"Converts one generic [[Iterable]] to another. Uses matcher for matching for finding if this converter is applicable."
by ("Wojciech Potiopa")
shared provided
class IterableToIterableConverter() satisfies Converter<{Anything*},{Anything*}> {
	shared actual {Anything*} convert(Delegator delegator, {Anything*} source, Type<{Anything*}> resultType) {
		assert (is ClassOrInterface<{Anything*}> resultType);
		assert (exists explictIterableType = typeHierarchy(resultType).findByDeclaration(`interface Iterable`));
		assert (exists elementType = explictIterableType.typeArgumentList.first);
		value args = source.map((Anything element) => delegator.convert(element, elementType)).sequence();
		value narrowedArgs = runtimeCall.iterable.narrow(args, elementType);
		value resolvedType = delegator.resolve(args, resultType);
		return delegator.create(resolvedType, narrowedArgs);
	}
	
	shared actual Convertion<{Anything*},{Anything*},Type<{Anything*}>>.Matcher? matcher => object satisfies Convertion<{Anything*},{Anything*},Type<{Anything*}>>.Matcher {
		
		shared actual Boolean match({Anything*} source, Type<{Anything*}> resultType) => resultType is ClassOrInterface<{Anything*}>;
		
		shared actual Integer priority => 1;
	};
}
