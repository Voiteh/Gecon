

import herd.codamo.api.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Module,
	ClassDeclaration
}
import herd.codamo.api.operation {
	Operation,
	WiredAnnotation
}
import herd.codamo.api.meta {
	annotatedDeclaration,
	instantiate
}

"Extracts and instantiates [[Operation]]s from a [[module]]"
shared {Operation*} provideOperations(Module \imodule)=>annotatedDeclaration<WiredAnnotation>(\imodule)
		.map((ClassDeclaration declaration) => instantiate<Operation>(declaration));

"Provider which handles provisioning of [[WiredAnnotation]] annotated [[Operation]]s"
shared class WireingProvider(Module \imodule,
	shared actual default {Operation*} operations =provideOperations(\imodule),
	shared actual default {Configuration*} configurations={}
	) satisfies Provider {}
