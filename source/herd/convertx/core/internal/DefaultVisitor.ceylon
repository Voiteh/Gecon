import herd.convertx.core.api.component {
	TypedConverter,
	TypedCreator,
	TypedResolver
}
import ceylon.language.meta.model {
	Class
}
import ceylon.language.meta {
	typeLiteral
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.logicals {
	Visitor,
	Findable,
	Executable,
	Matchable
}
import herd.convertx.core.api.configuration {
	Configurable
}
import herd.convertx.core.configuration {
	Logging
}
import ceylon.logging {
	logger
}

String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";
shared class DefaultVisitor() satisfies Visitor & Configurable<Logging>{
	
	
	value log=logger(`package`);
	shared actual void configure(Logging configuration) {
		
	}
	
	shared actual [Findable, Executable] prepareConverterRegistration<Source, Result, ResultType>(TypedConverter<Source,Result,ResultType> converter) {
		Findable findable;
		if (exists matcher = converter.matcher) {
			
			findable =object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if (is [Source, ResultType] args) {
						result= matcher.match(*args);
					}
					else{
						result=false;
					}
					log.trace("``matchingResultLog(result)``,for Converter: ``converter`` ");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				string = "Matchable for converter - ``converter``";
			};
		}else{
			value sourceType = typeLiteral<Source>();
			value resultType = typeLiteral<Result>();
			findable= DefaultHashable(sourceType, resultType);
		}
		value executable=object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Context,Source,ResultType] args);
				assert(is Result result=converter.convert(*args));
				return result;
				
			}
			string => converter.string;
			
	
		};
		return [findable,executable];
	}
	
	shared actual [Findable, Executable] prepareCreatorRegistration<Args, Result, ResultType>(TypedCreator<Args,Result,ResultType> creator) {
		Findable findable;
		if(exists matcher=creator.matcher){
			findable=object satisfies Matchable{
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if(is [Class<ResultType> ,Args] args){
						result=matcher.match(*args);
					}
					else {
						result=false;
					}
					log.trace("``matchingResultLog(result)``, for Creator: ``creator``");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				
				string = "Matchable for creator - ``creator``";
			};
		}else{
			
			value kind=typeLiteral<Result>();
			value args =typeLiteral<Args>();
			findable=DefaultHashable(kind,args);
		}
		value flatten =object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Context,Class<ResultType>, Args] args);
				assert(is Result result= creator.create(*args));
				return result;
			}
			
			string => creator.string;
			
			
		};
		return [findable,flatten];
	}
	
	shared actual [Findable, Executable] prepareResolverRegistration<Source, Result, ResultType>(TypedResolver<Source,Result,ResultType> resolver) {
		Findable findable;
		if (exists matcher = resolver.matcher) {
			findable= object satisfies Matchable {
				shared actual Boolean match(Anything[] args) {
					Boolean result;
					if (is [Source,ResultType] args) {
						result= matcher.match(*args);
					}
					else{
						result =false;
					}
					log.trace("``matchingResultLog(result)``, for Resolver: ``resolver`` ");
					return result;
				}
				shared actual Integer priority = matcher.priority;
			};
			
		}else{
			value input = typeLiteral<Source>();
			value output = typeLiteral<Result>();
			findable= DefaultHashable(input,output);
		}
		value flatten = object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Context,Source,ResultType] args);
				assert(is Result result=resolver.resolve(*args));
				return result;

			}
			string => resolver.string;
		};
		return [findable,flatten];
	}

	
	
}