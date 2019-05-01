import ceylon.language.meta.model {
	Type,
	ClassOrInterface,
	Interface
}
import herd.type.support {

	flat
}

"Provides type of iterable type argument"
shared Type<> iterableTypeArgument(ClassOrInterface<{Anything*}> iterableType){
	
	assert(exists typeArgument=flat.types(iterableType).narrow<Interface<>>()
			.find((Interface<> element) => element.declaration.equals(`interface Iterable`))
			?.typeArgumentList
			?.first);
	return typeArgument;
}

