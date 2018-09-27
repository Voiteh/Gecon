

import herd.modaco.api.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Module,
	ClassDeclaration
}
import herd.modaco.api.operation {
	Operation,
	WiredAnnotation
}
import herd.modaco.api.meta {
	annotatedDeclaration,
	instantiate
}

shared {Operation*} provideOperations(Module \imodule)=>annotatedDeclaration<WiredAnnotation>(\imodule)
		.map((ClassDeclaration declaration) => instantiate<Operation>(declaration));


shared class WireingProvider(Module \imodule,
	shared actual default {Operation*} operations =provideOperations(\imodule),
	shared actual default {Configuration*} configurations={}
	) satisfies Provider {}
