import ceylon.language.meta.declaration {
	ClassDeclaration
}
import ceylon.language.meta.model {
	Class
}

"Annotation class for [[provided]]f or automatic provisioning of [[Operation]], "
by("Wojciech Potiopa")
shared annotation final class ProvidedAnnotation() satisfies OptionalAnnotation<ProvidedAnnotation,ClassDeclaration,Class<Operation>>{}

"Annotation for automatic provisioning of [[Operation]], "
by("Wojciech Potiopa")
shared annotation ProvidedAnnotation provided() => ProvidedAnnotation();