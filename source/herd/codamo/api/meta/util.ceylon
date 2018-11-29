import ceylon.language.meta.model {
	ClassModel,
	Attribute
}
import ceylon.language.meta {
	type
}
import ceylon.language.meta.declaration {
	ClassDeclaration,
	Module,
	Package
}
"Holds attributes names which should be filtered for convertion purpose"
by("Wojciech Potiopa")
String[] filteredAttributeNames = `Object`.getAttributes<Object,Anything,Nothing>()
		.append(`Identifiable`.getAttributes<Identifiable,Anything,Nothing>())
		.map((Attribute<Identifiable,Anything,Nothing> element) => element.declaration.name)
		.sequence();
"Convertion between object do not require having attributes such as [[Object.string]] or [[Object.hash]], this function filters them out of provided data object"
by("Wojciech Potiopa")
shared Boolean filterObjectAndIdentifiableAttributes(Attribute<> attribute) {
	return !filteredAttributeNames.contains(attribute.declaration.name);
}

"Because [[type]] function, provides closest type information, for object instances like enums, 
 anonymous instances like [[true]], [[false]], tuple of objects like [[[true,false]]], when using [[Object.hash]] on their types,
 it will be different than the one which would be provided by [[`Boolean`.hash]]. 
 This function gives ability to get the actual class/interface type information. It is not ideal and do not handles object types in type parameters. "
by("Wojciech Potiopa")
shared ClassModel<Data> extractObjectType<Data>(Data data) {
	value clazz = type(data);
	if (clazz.declaration.anonymous) {
		assert (is ClassModel<Data> extendedType = clazz.extendedType);
		return extendedType;
	}
	return clazz;
}
"Extract class declartions for given [[Annotation]] and [[owner]]"
by("Wojciech Potiopa")
shared {ClassDeclaration*} annotatedDeclaration<Annotation>(
	"Scope for extraction class declarations"
	Package|Module owner) given Annotation satisfies ConstrainedAnnotation<> {
	switch (owner)
	case (is Package) {
		return owner.annotatedMembers<ClassDeclaration,Annotation>();
	}
	case (is Module) {
		return owner.members
				.flatMap((Package element) => annotatedDeclaration<Annotation>(element));
	}
}
"Helper function for instatiation of class instances"
by("Wojciech Potiopa")
shared Instance instantiate<Instance>(ClassDeclaration declaration) => declaration.classApply<Instance>().apply();
