import ceylon.language.meta.declaration {
	ClassDeclaration
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.api.operation {
	Operation
}
shared annotation final class WiredAnnotation() satisfies OptionalAnnotation<WiredAnnotation,ClassDeclaration,Class<Operation>>{}
shared annotation WiredAnnotation wired() => WiredAnnotation();