import herd.convertx.core.api {
	Provider
}
import herd.convertx.core.api.component {
	Component
}
import ceylon.language.meta.model {
	ClassOrInterface
}

shared abstract class BasicProvider() satisfies Provider {
	
	shared {Component*} fromClassOrInterface(ClassOrInterface<> classOrInterface) =>
		classOrInterface.caseValues.narrow<Component>();
}
