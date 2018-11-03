import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.meta {
	Relation,
	AttributesMapping,
	filterObjectAndIdentifiableAttributes
}
import herd.codamo.api.operation {
	CreationError,
	Delegator
}
import herd.codamo.api.component {
	Creator
}


"Support API for creation of Codamo modules. Usefull only for generic applicatons. Provides ability to create [[AttributesMapping]]. 
 Uses mapping between [[Source]] parts based on key, like [[Map<String,Data>]] to [[Result]] attributes"
shared abstract class AttributesMapper<Source, Result>()
		satisfies Creator<Relation<Source,Result>,AttributesMapping>
		given Source satisfies Object {
	
	"Refine to provide source attribute names to be used for retreival of values"
	shared formal String[] extractSourcePartsKey(Source source);
	
	"Refine to provide values out of [[Source]] for given [[key]]"
	shared formal Anything extractSourcePartValue(Source source, String key);
	
	"Refine if [[Result]] attributes will not match exactly names for keys" 
	shared default Attribute<>? findResultAttribute(String sourcePartKey,Attribute<>[] resultAttributes)
			=>resultAttributes.find((Attribute<> attribute) => attribute.declaration.name==sourcePartKey);
	
	"Creates [[AttributesMapping]] or throws [[CreationError]] when [[Result]] [[Attribute]] can't be found"
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Relation<Source,Result> relation) {
		value resultAttributes=relation.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).sequence();
		value entries=extractSourcePartsKey(relation.source)
				.map((String name) {
			value attribute=findResultAttribute(name, resultAttributes);
			if(exists attribute){
				value toConvert=extractSourcePartValue(relation.source, name);
				value part=delegator.convert(toConvert, attribute.type);
				return attribute->part;
			}
			else{
				throw CreationError(kind,Exception("Can't find attribute by name: ``name`` in ``relation.resultClass`` type"));
			}
		});
		return AttributesMapping(entries);
	}
	
	 
	
	
	
}
