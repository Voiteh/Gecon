import ceylon.language.meta.model {
	ClassModel,
	Type
}
import ceylon.language.meta {
	type
}
"Hashable implementation"
shared class Hasher(shared actual Classificator classificator,Anything* toHash) satisfies Classificable {
	
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
		if (is Hasher that) {
			return this.hash==that.hash;
		}
		else {
			return false;
		}
	}
}