import herd.convertx.core.api {
	Provider
}
import ceylon.language.meta.declaration {
	Module,
	Package,
	ClassDeclaration
}
import herd.convertx.core.api.component {
	Component,
	WiredAnnotation
}
import ceylon.collection {
	ArrayList,
	MutableList
}
import ceylon.language.meta.model {
	Class
}

shared class WiredProvider(Module* modules) satisfies Provider {
	shared actual MutableList<Component> components {
		value created= modules.flatMap((Module modul) => modul.members)
		.flatMap((Package pakage) => pakage.annotatedMembers<ClassDeclaration, WiredAnnotation>())
		.map((ClassDeclaration element) => element.classApply<Component>())
		.map((Class<Component> element) => element.apply());
		return ArrayList<Component>{elements=created;};
	}
}
