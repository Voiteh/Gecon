import ceylon.language.meta.model {
	ClassModel,
	Type,
	Class
}
import ceylon.language.meta {
	type,
	typeLiteral
}
import herd.convertx.core.api.component {
	TypedResolver,
	TypedCreator,
	TypedConverter
}
shared interface Findable of Hashable|Matchable{
	shared static interface Adapter{
		shared formal Findable adaptConverter<Source, ResultType,Result>(TypedConverter<Source,ResultType,Result> converter);
		shared formal Findable adaptResolver<Output,OutputType,Input>(TypedResolver<Output,OutputType,Input> resolver);
		shared formal Findable adaptCreator<Result,Kind,Args>(TypedCreator<Result,Kind,Args> creator);
	}
	
	 
	
}


Findable.Adapter defaultFindableAdapter=> object satisfies Findable.Adapter{
	shared actual Findable adaptConverter<Source, ResultType,Result>(TypedConverter<Source,ResultType,Result> converter){
		if (exists matcher = converter.matcher) {
			return object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					if (is [Source, ResultType] args) {
						return matcher.match(*args);
					}
					return false;
				}
				
				shared actual Integer priority = matcher.priority;
				string = "Matchable for converter - ``converter``";
			};
		}
		value sourceType = typeLiteral<Source>();
		value resultType = typeLiteral<Result>();
		return Hashable(sourceType, resultType);
		
		
		
		
	}
	shared actual Findable adaptResolver<Output,OutputType,Input>(TypedResolver<Output,OutputType,Input> resolver){
		if (exists matcher = resolver.matcher) {
			return object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					if (is [Input,OutputType] args) {
						value match= matcher.match(*args);
						return match;
					}
					return false;
				}
				shared actual Integer priority = matcher.priority;
			};
			
		}
		value input = typeLiteral<Input>();
		value output = typeLiteral<Output>();
		
		return Hashable(input,output);
	}
	shared actual Findable adaptCreator<Result,Kind,Args>(TypedCreator<Result,Kind,Args> creator){
		if(exists matcher=creator.matcher){
			return object satisfies Matchable{
				shared actual Boolean match(Anything[] args) {
					if(is [Class<Kind> , Args ] args){
						return matcher.match(*args);
					}
					return false;
				}
				
				shared actual Integer priority = matcher.priority;
				
				string = "Matchable for creator - ``creator``";
			};
		}
		value kind=typeLiteral<Kind>();
		value args =typeLiteral<Args>();
		return Hashable(kind,args);
	}
	
};

shared sealed class Hashable(Anything* toHash) satisfies Findable {
	
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
	
	string ="Hashed: ``toHash``, value: ``hash.string``";
	
	
	shared actual Boolean equals(Object that) {
		if (is Hashable that) {
			return this.hash==that.hash;
		}
		else {
			return false;
		}
	}
}
shared sealed interface Matchable satisfies Findable{
	shared formal Boolean match(Anything[] args);
	
	shared formal Integer priority;
}