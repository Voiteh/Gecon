import ceylon.language.meta.model {
	ClassModel,
	Type
}
import ceylon.language.meta {
	type
}

shared alias Findable => Hashable|Matchable;

"Hashable implementation"
shared class Hashable(Anything* toHash) {
	
	Type<> extractType(Anything data){
		Type<> result;
		switch(data)
		case (is ClassModel<>|Type<>){
			if(is ClassModel<> data){
				if(data.declaration.anonymous){
					assert(exists extendedType=data.extendedType);
					result =extendedType;
				}else{
					result=data;
				}
			}
			else{
				result=data;
			}
			
		}else{
			result=extractType(type(data));
		}
		return result;
	}
	
	
	
	
	hash =toHash.fold(0)((Integer initial, Anything element) => 32*initial+extractType(element).hash);
	
	string ="Value: ``hash.string``,Hashed: ``toHash``, ";
	
	
	shared actual Boolean equals(Object that) {
		if (is Hashable that) {
			return this.hash==that.hash;
		}
		else {
			return false;
		}
	}
}
"Findable implementation"
shared interface Matchable {
	shared formal Boolean match(Anything[] args);
	
	shared formal Integer priority;
}


