import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	TypedConverter,
	wired
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import herd.convertx.core.util {
	typeHierarchy,
	runtimeCall
}

shared wired class IterableToIterableConverter() satisfies  TypedConverter<{Anything*},ClassOrInterface<{Anything*}>,{Anything*}> {
	shared actual {Anything*} convert(Context context, {Anything*} source, ClassOrInterface<{Anything*}> resultType){
			assert(exists explictIterableType = typeHierarchy(resultType).findByDeclaration(`interface Iterable`));
			assert(exists elementType=explictIterableType.typeArgumentList.first);
			value args = source.map((Anything element) => context.convert(element, elementType)).sequence();
			value narrowedArgs=runtimeCall.iterable.narrow(args, elementType);
			value resolvedType=context.resolve(args,resultType);
			return context.create(resolvedType, narrowedArgs);
	}
	
	
	matcher =>  object satisfies IterableToIterableConverter.Matcher{
		shared actual Boolean match({Anything*} source, ClassOrInterface<{Anything*}> resultType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
	
	
		
}

