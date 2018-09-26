import herd.convertx.api {
	Provider,
	WiredAnnotation
}

import ceylon.collection {
	ArrayList,
	MutableList
}
import herd.convertx.api.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Package,
	Module,
	ClassDeclaration
}
import herd.convertx.api.operation {
	Operation
}

shared class WireingProvider(Module \imodule,{Operation*} additionalComponents={},{Configuration*} additionalConfiguration={}) satisfies Provider {
	

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
	
	shared actual MutableList<Operation> components =ArrayList<Operation>{
		elements=annotatedDeclaration<WiredAnnotation>(\imodule)
			.map((ClassDeclaration declaration) => instantiate<Operation>(declaration)).chain(additionalComponents);
	};
	
	shared actual MutableList<Configuration> configurations => ArrayList<Configuration>{
		elements=additionalConfiguration;
	};
	
}
