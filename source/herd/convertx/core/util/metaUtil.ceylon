import ceylon.language.meta.model {
	Attribute,
	ClassModel
}
import ceylon.language.meta {
	type
}
shared Attribute<Nothing,Anything,Nothing>[] objectAndIdentifiableAttributes = `Object`.getAttributes<Object,Anything,Nothing>()
		.append(`Identifiable`.getAttributes<Identifiable,Anything,Nothing>());


shared Boolean filterObjectAndIdentifiableAttributes(Attribute<> attribute){
	return !objectAndIdentifiableAttributes.contains(attribute);
}


shared ClassModel<Data> extractObjectType<Data>(Data data){
	value clazz=type(data);
	if(clazz.declaration.anonymous){
		assert(is ClassModel<Data> extendedType= clazz.extendedType);
		return extendedType;
	}
	return clazz;
}