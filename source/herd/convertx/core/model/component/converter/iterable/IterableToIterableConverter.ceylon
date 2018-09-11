import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	wired,
	Converter
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.convertx.core.util {
	typeHierarchy,
	runtimeCall
}

shared wired class IterableToIterableConverter() satisfies Converter<{Anything*},{Anything*}> {
	shared actual {Anything*} convert(Context context, {Anything*} source, Type<{Anything*}> resultType){
			assert(is ClassOrInterface<{Anything*}> resultType);
			assert(exists explictIterableType = typeHierarchy(resultType).findByDeclaration(`interface Iterable`));
			assert(exists elementType=explictIterableType.typeArgumentList.first);
			value args = source.map((Anything element) => context.convert(element, elementType)).sequence();
			value narrowedArgs=runtimeCall.iterable.narrow(args, elementType);
			value resolvedType=context.resolve(args,resultType);
			return context.create(resolvedType, narrowedArgs);
	}
	
	
	matcher =>  object satisfies IterableToIterableConverter.Matcher{
		shared actual Boolean match({Anything*} source, Type<{Anything*}> resultType) => resultType is ClassOrInterface<{Anything*}>;
		
		shared actual Integer priority => 1;
		
		
	};
	
	
		
}

