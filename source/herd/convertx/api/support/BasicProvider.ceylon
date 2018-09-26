import herd.convertx.api {
	Provider
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import herd.convertx.api.operation {
	Operation
}

shared abstract class BasicProvider() satisfies Provider {
	
	shared {Operation*} fromClassOrInterface(ClassOrInterface<> classOrInterface) =>
		classOrInterface.caseValues.narrow<Operation>();
}
