import ceylon.language.meta.declaration {
	ClassDeclaration
}
import ceylon.language.meta.model {
	Class
}

"Annotation class for [[provided]]f or automatic provisioning of [[Transformation]], "
by("Wojciech Potiopa")
shared annotation final class ProvidedAnnotation() satisfies OptionalAnnotation<ProvidedAnnotation,ClassDeclaration,Class<Transformation>>{}

"Annotation for automatic provisioning of [[Transformation]], "
by("Wojciech Potiopa")
shared annotation ProvidedAnnotation provided() => ProvidedAnnotation();