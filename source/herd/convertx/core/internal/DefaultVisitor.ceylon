import herd.convertx.api.component {
	TypedConverter,
	TypedCreator,
	TypedResolver
}
import ceylon.language.meta.model {
	Class,
	Type
}
import ceylon.language.meta {
	typeLiteral
}
import herd.convertx.api {
	Context
}

import herd.convertx.api.configuration {
	Configurable
}
import herd.convertx.core.configuration {
	Logging
}
import ceylon.logging {
	logger
}
import herd.convertx.api.registration {
	Executable,
	Findable,
	Matchable,
	Visitor
}

String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";
shared class DefaultVisitor() satisfies Visitor & Configurable<Logging>{
	
	
	value log=logger(`package`);
	shared actual void configure(Logging configuration) {
		log.priority=configuration.priority;
	}
	
	shared actual [Findable, Executable] prepareConverterRegistration
			<Source, Result, ResultType>
			(TypedConverter<Source,Result,ResultType> converter)
			given ResultType satisfies Type<Result> 
	{
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
					log.trace("``matchingResultLog(result)``,for Converter: ``converter``, Args:``args`` ");
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
				log.debug("[``converter``] Converting ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				
				assert(is Result result=converter.convert(*args));
				log.debug("[``converter``] Converted ``args.rest.first else "null"`` to ``result else "null"``");

				return result;
				
			}
			string => converter.string;
			
	
		};
		return [findable,executable];
	}
	
	shared actual [Findable, Executable] prepareCreatorRegistration<Args, Result, ResultType>
			(TypedCreator<Args,Result,ResultType> creator)
			given ResultType satisfies Result 
	{
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
					log.trace("``matchingResultLog(result)``, for Creator: ``creator``, Args:``args`` ");
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
				log.debug("[``creator``] Creating ``args.rest.first``, using arguments: ``args.rest.rest.first else "null"``");
				assert(is Result result= creator.create(*args));
				log.info("[``creator``] Created ``result else "null"``, using arguments: ``args.rest.rest.first else "null"``");
				return result;
			}
			
			string => creator.string;
			
			
		};
		return [findable,flatten];
	}
	
	shared actual [Findable, Executable] prepareResolverRegistration<Source, Result, ResultType>
			(TypedResolver<Source,Result,ResultType> resolver) 
			given ResultType satisfies Type<Result>
	{
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
					log.trace("``matchingResultLog(result)``, for Resolver: ``resolver``, Args:``args``  ");
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
				log.debug("[``resolver``] Resolving ``args.rest.first else "null" ``, to ``args.rest.rest.first``");
				assert(is Result result=resolver.resolve(*args));
				log.info("[``resolver``] Resolved ``args.rest.first else "null"`` to ``result``");
				return result;

			}
			string => resolver.string;
		};
		return [findable,flatten];
	}

	
	
}