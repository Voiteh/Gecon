import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Component,
	TypedConverter
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import herd.convertx.core.util {
	typeHierarchy,
	runtimeCall
}
service(`interface Component`)
shared class IterableToIterableConverter() satisfies  TypedConverter<{Anything*},ClassOrInterface<{Anything*}>,{Anything*}> {
	shared actual {Anything*} convert(Context context, {Anything*} source, ClassOrInterface<{Anything*}> resultType){
			value resolvedType=context.resolve(resultType);
			assert(exists explictIterableType = typeHierarchy(resolvedType).findByDeclaration(`interface Iterable`));
			assert(exists elementType=explictIterableType.typeArgumentList.first);
			value args = source.map((Anything element) => context.convert(element, elementType)).sequence();
			value creatorArgs = runtimeCall.iterable.narrow(args, elementType);
			return context.create(resolvedType, creatorArgs);
	}
	
	
	matcher =>  object satisfies IterableToIterableConverter.Matcher{
		shared actual Boolean match({Anything*} source, ClassOrInterface<{Anything*}> resultType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
	
	
		
}

