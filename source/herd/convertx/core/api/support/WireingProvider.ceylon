import herd.convertx.core.api {
	Provider
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
	Configuration
}
import ceylon.language.meta.declaration {
	Package,
	Module,
	ClassDeclaration
}

shared class WireingProvider(Module \imodule,{Component*} additionalComponents={},{Configuration*} additionalConfiguration={}) satisfies Provider {
	

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
	
	Instance instantiate<Instance>(ClassDeclaration declaration) => declaration.classApply<Instance>().apply();
	
	shared actual MutableList<Component> components =ArrayList<Component>{
		elements=annotatedDeclaration<WiredAnnotation>(\imodule)
			.map((ClassDeclaration declaration) => instantiate<Component>(declaration)).chain(additionalComponents);
	};
	
	shared actual MutableList<Configuration> configurations => ArrayList<Configuration>{
		elements=additionalConfiguration;
	};
	
}
