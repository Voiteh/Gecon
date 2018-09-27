import ceylon.language.meta.model {
	Type,
	ClassOrInterface
}
import herd.modaco.core.util {
	typeHierarchy
}
shared Type<> iterableTypeArgument(ClassOrInterface<{Anything*}> iterableType){
	value hierarchy = typeHierarchy(iterableType);
	assert(exists explictIterable=hierarchy.findByDeclaration(`interface Iterable`));
	assert(exists elementType=explictIterable.typeArgumentList.first);
	return elementType;
}

