import herd.codamo.api.core.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Module,
	ClassDeclaration
}

import herd.codamo.api.core.meta {
	annotatedDeclaration,
	instantiate
}
import herd.codamo.api.core.transformer {
	ProvidedAnnotation,
	Transformation
}

"Extracts and instantiates [[Transformation]]s from a [[module]]"
by("Wojciech Potiopa")
shared {Transformation*} provideOperations(Module \imodule)=>annotatedDeclaration<ProvidedAnnotation>(\imodule)
		.map((ClassDeclaration declaration) => instantiate<Transformation>(declaration));

"Provider which handles provisioning of [[ProvidedAnnotation]] annotated [[Transformation]]s"
shared class AutoProvider(
	"[[Module]] for which provisioning is made"
	Module \imodule,
	"Configurations for module. This is expermiental feature, the API for it may change"
	shared actual default {Configuration*} configurations={}
	) satisfies Provider {
		"Operations which are provided for [[module]]"
		shared actual default {Transformation*} operations =provideOperations(\imodule);
	}
