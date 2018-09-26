import ceylon.language.meta.model {
	ClassModel,
	Attribute
}
import ceylon.language.meta {
	type
}
String[] filteredAttributeNames = `Object`.getAttributes<Object,Anything,Nothing>()
		.append(`Identifiable`.getAttributes<Identifiable,Anything,Nothing>())
		.map((Attribute<Identifiable,Anything,Nothing> element) => element.declaration.name)
		.sequence();

shared Boolean filterObjectAndIdentifiableAttributes(Attribute<> attribute) {
	return !filteredAttributeNames.contains(attribute.declaration.name);
}

shared ClassModel<Data> extractObjectType<Data>(Data data) {
	value clazz = type(data);
	if (clazz.declaration.anonymous) {
		assert (is ClassModel<Data> extendedType = clazz.extendedType);
		return extendedType;
	}
	return clazz;
}