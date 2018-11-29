import ceylon.language.meta.declaration {
	ClassDeclaration
}
import ceylon.language.meta.model {
	Class
}

"Annotation class for [[wired]]f or automatic provisioning of [[Operation]], "
by("Wojciech Potiopa")
shared annotation final class WiredAnnotation() satisfies OptionalAnnotation<WiredAnnotation,ClassDeclaration,Class<Operation>>{}

"Annotation for automatic provisioning of [[Operation]], "
by("Wojciech Potiopa")
shared annotation WiredAnnotation wired() => WiredAnnotation();