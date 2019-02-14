import ceylon.language.meta.model {
	Class,
	Type
}
import ceylon.language.meta {
	typeLiteral
}


import ceylon.logging {
	Logger
}
import herd.codamo.api.core.transformer {
	Convertion,
	Creation,
	Resolvance,

	Delegator,
	Transformation
}



String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";

"Default implementatio of flatter"
shared class Flatter(Logger logger) satisfies Transformation.Adapter{
	
	shared actual [Findable, Executable] adaptConverter
			<Source, Result, ResultType>
			(Convertion<Source,Result,ResultType> converter)
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
					logger.trace("``matchingResultLog(result)``,for Converter: ``converter``, Args:``args`` ");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				string = "Matchable for converter - ``converter``";
			};
		}else{
			value sourceType = typeLiteral<Source>();
			value resultType = typeLiteral<Result>();
			findable= Hashable(sourceType, resultType);
		}
		value executable=object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("[``converter``] Converting ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				assert(is Result result=converter.convert(*args));
				logger.debug("[``converter``] Converted ``args.rest.first else "null"`` to ``result else "null"``");

				return result;
				
			}
			string => converter.string;
			
	
		};
		return [findable,executable];
	}
	
	shared actual [Findable, Executable] adaptCreator<Args, Result, ResultType>
			(Creation<Args,Result,ResultType> creator)
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
					logger.trace("``matchingResultLog(result)``, for Creator: ``creator``, Args:``args`` ");
					return result;
				}
				
				shared actual Integer priority = matcher.priority;
				
				string = "Matchable for creator - ``creator``";
			};
		}else{
			value kind=typeLiteral<Result>();
			value args =typeLiteral<Args>();
			findable=Hashable(kind,args);
		}
		value flatten =object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Delegator,Class<ResultType>, Args] args);
				logger.debug("[``creator``] Creating ``args.rest.first``, using arguments: ``args.rest.rest.first else "null"``");
				assert(is Result result= creator.create(*args));
				logger.debug("[``creator``] Created ``result else "null"``, using arguments: ``args.rest.rest.first else "null"``");
				return result;
			}
			
			string => creator.string;
			
			
		};
		return [findable,flatten];
	}
	
	shared actual [Findable, Executable] adaptResolver<Source, Result, ResultType>
			(Resolvance<Source,Result,ResultType> resolver) 
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
					logger.trace("``matchingResultLog(result)``, for Resolver: ``resolver``, Args:``args``  ");
					return result;
				}
				shared actual Integer priority = matcher.priority;
			};
			
		}else{
			value input = typeLiteral<Source>();
			value output = typeLiteral<Result>();
			findable= Hashable(input,output);
		}
		value flatten = object satisfies Executable{
			shared actual Result execute<Result>([Anything*] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("[``resolver``] Resolving ``args.rest.first else "null" ``, to ``args.rest.rest.first``");
				assert(is Result result=resolver.resolve(*args));
				logger.debug("[``resolver``] Resolved ``args.rest.first else "null"`` to ``result``");
				return result;

			}
			string => resolver.string;
		};
		return [findable,flatten];
	}

	
	
}