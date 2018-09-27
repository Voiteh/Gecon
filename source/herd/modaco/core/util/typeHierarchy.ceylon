import ceylon.language.meta.model {
	ClassOrInterface,
	ClassModel,
	InterfaceModel
}
import ceylon.language.meta.declaration {
	ClassOrInterfaceDeclaration,
	ClassDeclaration
}

shared interface TypeHierarchy{
	
	shared formal ClassOrInterface<>? findByDeclaration(ClassOrInterfaceDeclaration declaration);
	
	shared formal {ClassModel<>*} superTypes;
	shared formal {InterfaceModel<>*} interfaces;
	shared formal {ClassOrInterface<>*} allParent;
}

shared TypeHierarchy typeHierarchy(ClassOrInterface<> type) => object satisfies TypeHierarchy{
	
	{ClassModel<>*} extractSuperTypes(ClassOrInterface<> model) {
		if (exists extendendType = model.extendedType) {
			return { extendendType, *extractSuperTypes(extendendType) };
		}
		return empty;
	}
	{InterfaceModel<>*} extractSatisfiedTypes(ClassOrInterface<> model) {
		if (is InterfaceModel<> model) {
			return { model, *model.satisfiedTypes.flatMap((InterfaceModel<> element) => extractSatisfiedTypes(element)) };
		} else {
			return model.satisfiedTypes.flatMap((InterfaceModel<> element) => extractSatisfiedTypes(element));
		}
	}
	
	shared actual {ClassModel<>*} superTypes = extractSuperTypes(type);
	shared actual {InterfaceModel<>*} interfaces = extractSatisfiedTypes(type);
	shared actual {ClassOrInterface<Anything>*} allParent = superTypes.chain(interfaces);
	shared actual ClassOrInterface<Anything>? findByDeclaration(ClassOrInterfaceDeclaration declaration) {
		if(type.declaration==declaration){
			return type;
		}else if(is ClassDeclaration declaration){
			return superTypes.find((ClassModel<Anything,Nothing> element) => element.declaration==declaration);
		}else{
			return interfaces.find((InterfaceModel<Anything> element) => element.declaration==declaration);
		}
	}
	
	
	
	
	

};



