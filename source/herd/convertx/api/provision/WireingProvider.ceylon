import herd.convertx.api {
	WiredAnnotation
}

import herd.convertx.api.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Module,
	ClassDeclaration
}
import herd.convertx.api.operation {
	Operation
}
import herd.convertx.api.meta {
	annotatedDeclaration,
	instantiate
}

shared {Operation*} provideOperations(Module \imodule)=>annotatedDeclaration<WiredAnnotation>(\imodule)
		.map((ClassDeclaration declaration) => instantiate<Operation>(declaration));


shared class WireingProvider(Module \imodule,
	shared actual default {Operation*} operations =provideOperations(\imodule),
	shared actual default {Configuration*} configurations={}
	) satisfies Provider {}
