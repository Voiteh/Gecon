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
import herd.convertx.core.api.configuration {
	ConfigurationAnnotation
}

shared class WiredProvider(Module \imodule) satisfies Provider {
	
	{ClassDeclaration*} annotatedDeclaration<Annotation>(Package|Module owner) given Annotation satisfies ConstrainedAnnotation<> {
		switch (owner)
		case (is Package) {
			return owner.annotatedMembers<ClassDeclaration,Annotation>();
		}
		case (is Module) {
			return owner.members
				.flatMap((Package element) => annotatedDeclaration<Annotation>(element));
		}
	}
	
	Instance instantaiate<Instance>(ClassDeclaration declaration) => declaration.classApply<Instance>().apply();
	
	shared actual MutableList<Component> components = ArrayList<Component> {
		elements = annotatedDeclaration<WiredAnnotation>(\imodule)
			.map((ClassDeclaration declaration) => instantaiate<Component>(declaration))
			.sequence();
	};
	shared actual MutableList<Object> configurations = ArrayList<Object> {
		elements = annotatedDeclaration<ConfigurationAnnotation>(\imodule)
			.map((ClassDeclaration declaration) => instantaiate<Object>(declaration))
			.sequence();
	};
}
