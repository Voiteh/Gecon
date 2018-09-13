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
	Resolver,
	Creator,
	Converter
}




import herd.convertx.core {
	logger
}
shared interface Findable of Hashable|Matchable{
	shared static interface Adapter{
		shared formal Findable adaptConverter<Source,Result>(Converter<Source,Result> converter);
		shared formal Findable adaptResolver<Source,Result>(Resolver<Source,Result> resolver);
		shared formal Findable adaptCreator<Args,Result>(Creator<Args,Result> creator);
	}
	
	 
	
}

String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";

Findable.Adapter defaultFindableAdapter=> object satisfies Findable.Adapter{
	shared actual Findable adaptConverter<Source,Result>(Converter<Source,Result> converter){
		if (exists matcher = converter.matcher) {
			return object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if (is [Source, Type<Result>] args) {
						result= matcher.match(*args);
					}
					else{
						result=false;
					}
					logger.trace("``matchingResultLog(result)``,for Converter: ``converter`` ");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				string = "Matchable for converter - ``converter``";
			};
		}
		value sourceType = typeLiteral<Source>();
		value resultType = typeLiteral<Result>();
		return Hashable(sourceType, resultType);
		
		
		
		
	}
	shared actual Findable adaptResolver<Source,Result>(Resolver<Source,Result> resolver){
		if (exists matcher = resolver.matcher) {
			return object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if (is [Source,Type<Result>] args) {
						result= matcher.match(*args);
					}
					else{
						result =false;
					}
					logger.trace("``matchingResultLog(result)``, for Resolver: ``resolver`` ");
					return result;
				}
				shared actual Integer priority = matcher.priority;
			};
			
		}
		value input = typeLiteral<Source>();
		value output = typeLiteral<Result>();
		
		return Hashable(input,output);
	}
	shared actual Findable adaptCreator<Args,Result>(Creator<Args,Result> creator){
		if(exists matcher=creator.matcher){
			return object satisfies Matchable{
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if(is [Class<Result> ,Args] args){
						result=matcher.match(*args);
					}
					else {
						result=false;
					}
					logger.trace("``matchingResultLog(result)``, for Creator: ``creator``");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				
				string = "Matchable for creator - ``creator``";
			};
		}
		value kind=typeLiteral<Result>();
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
shared sealed interface Matchable satisfies Findable{
	shared formal Boolean match(Anything[] args);
	
	shared formal Integer priority;
}