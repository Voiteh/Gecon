import ceylon.language.meta.model {
	ClassModel,
	Type
}
import ceylon.language.meta {
	type
}

import herd.convertx.api.registration {
	Hashable
}
shared sealed class DefaultHashable(Anything* toHash) satisfies Hashable {
	
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
		if (is DefaultHashable that) {
			return this.hash==that.hash;
		}
		else {
			return false;
		}
	}
}