import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Attribute,
	Class,
	ClassOrInterface
}


import herd.codamo.api.core.transformer {
	Mapper,
	Matchable
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
shared class DefaultAttributeMapper() extends Mapper<Object,ClassOrInterface<Anything>>(){
	shared actual Map<Object,Anything> map(Object source, ClassOrInterface<Anything> resultType) {
		value sourceType = type(source);
		value sourceAttributes=sourceType.getAttributes<>();
		value mapping=resultType.getAttributes<>()
				.filter(filterObjectAndIdentifiableAttributes)
		.tabulate((Attribute<Nothing,Anything,Nothing> key) => 
			sourceAttributes.find((Attribute<Nothing,Anything,Nothing> item) => key.declaration.name==item.declaration.name)
				?.bind(source)?.get());
				
		return mapping;
	}
	
	matchable=object satisfies Matchable<Object,ClassOrInterface<>>{
		shared actual Boolean predicate(Object source, ClassOrInterface<Anything> resultType) => resultType is Class<>;
		
		shared actual Integer priority = 0;
		
		
	};
}