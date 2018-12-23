import ceylon.language.meta.model {
	ClassOrInterface,
	ClassModel,
	InterfaceModel
}
import ceylon.language.meta.declaration {
	ClassOrInterfaceDeclaration,
	ClassDeclaration
}


"Type hierarchy interface. Uses for extracting specific types out ot [[ClassOrInterface]]"
shared interface TypeHierarchy{
	
	"Finds [[ClassOrInterface]]|[[Null]] with [[declaration]] in extracted type hierarchy of an object"
	shared formal ClassOrInterface<>? findByDeclaration(ClassOrInterfaceDeclaration declaration);
	
	"Super types of provided object. The oldest ancestors will be at the begginig of this iterable. The youngest at the end."
	shared formal {ClassModel<>*} superTypes;
	"All interfaces satisfied by provided object and it's ancestors (currently duplicates may occur)"
	shared formal {InterfaceModel<>*} interfaces;
	"All of parents, mixin of [[superTypes]] and [[interfaces]]"
	shared formal {ClassOrInterface<>*} allParent;
}
"Implementation of [[TypeHierarchy]]"
shared TypeHierarchy typeHierarchy(ClassOrInterface<> type) => object satisfies TypeHierarchy{
	
	"Recursive implementation of super types extraction"
	{ClassModel<>*} extractSuperTypes(ClassOrInterface<> model) {
		if (exists extendendType = model.extendedType) {
			return { extendendType, *extractSuperTypes(extendendType) };
		}
		return empty;
	}
	"Recursive implementation of interfaces extraction "
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



