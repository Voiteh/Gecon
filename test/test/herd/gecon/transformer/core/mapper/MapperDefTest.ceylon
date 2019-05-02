import ceylon.language.meta.model {
	Attribute,
	Type,
	Class
}
import herd.gecon.core.api.transformer {
	Relation,
	Resolver,
	Delegator}
import herd.gecon.core.api.dictionary {
	Dictionary,
	AttributeDictionary
}

shared class AttributeMap({<Attribute<>->Anything>*} stream) satisfies Map<Attribute<>, Anything>{
	
	
	shared actual Boolean defines(Object key) => stream.map((Attribute<> elementKey -> Anything elementItem) => elementKey).contains(key);
	
	shared actual Anything get(Object key) => stream.find((Attribute<Nothing,Anything,Nothing> elementKey -> Anything elementItem) => key==elementKey)?.item;
	
	shared actual Iterator<Attribute<Nothing,Anything,Nothing>->Anything> iterator() => stream.iterator();
	
	shared actual Integer hash => stream.hash;
		
	
	shared actual Boolean equals(Object that) {
		if (is AttributeMap that) {
			return that.hash==hash;
		}
		else {
			return false;
		}
	}
	
	
}

shared class RelationToAttributeMapResolver() extends Resolver<Relation<Object, Object>, Dictionary<Object,Anything>, Type<Dictionary<Object,Anything>>>(){
	shared actual Class<Dictionary<Object,Anything>,Nothing> resolve(Delegator delegator, Relation<Object,Object> input, Type<Dictionary<Object,Anything>> outputType) => `AttributeDictionary`;
	
	matcher=>Matcher{
		Boolean predicate(Relation<Object,Object> source, Type<Dictionary<Object,Anything>> resultType) => true;
		Integer priority => 0;
	};
	
}
