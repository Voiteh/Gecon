import ceylon.language.meta {
	typeLiteral
}
import ceylon.language.meta.model {
	Class,
	Type
}
import ceylon.logging {
	Logger
}

import herd.codamo.api.core.transformer {
	Registrable,
	Convertion,
	Resolvance,
	Creation,
	Matchable,
	Delegator,
	Mapping
}
import herd.codamo.engine.internal.clasification {
	Classificable,
	Classificator,
	creator=creation,
	resolver=resolvance,
	converter=convertion,
	mapper=mapping,
	Matcher,
	Hasher
}
shared class TransformationAdapter(Logger logger) satisfies Registrable.Adapter{
		
	String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";
	
	shared actual [Classificable,Transformation] convertion<Source, Result, ResultType>(Convertion<Source,Result,ResultType> preparee, Matchable<Source,ResultType>? matchable)
			given ResultType satisfies Type<Result> {
		
		Classificator classificator=converter;
		
		Transformation transformation= object satisfies Transformation{
				shared actual Result transform<Result>(Anything[] args) {
					assert(is [Delegator,Source,ResultType] args);
					logger.debug("[``preparee``] Converting ``args.rest.first else "null"`` to ``args.rest.rest.first``");
					assert(is Result result=preparee.convert(*args));
					logger.debug("[``preparee``] Converted ``args.rest.first else "null"`` to ``result else "null"``");
					return result;
					
				}
				
				string => preparee.string;
				
		};
			Classificable classificable= if(exists matchable) then Matcher { 
				classificator = classificator;
				priority = matchable.priority;
				
				Boolean match(Anything[] args){
					Boolean result;	
					if (is [Source,ResultType] args) {
						result= matchable.predicate(*args);
					}
					else{
						result =false;
					}
					logger.trace("``matchingResultLog(result)``, for ``preparee``, Args:``args``  ");
					return result;
				}
				
				
			}
		else Hasher{ 
				classificator = classificator; 
				toHash = [typeLiteral<Source>(),typeLiteral<Result>()];
			};
		
		return [classificable,transformation];
	}
	
	shared actual [Classificable,Transformation] creation<Source, Result, ResultType>(Creation<Source,Result,ResultType> preparee, Matchable<Source,Class<ResultType,Nothing>>? matchable)
			given ResultType satisfies Result {
		Classificator classificator=creator;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Class<ResultType>,Source] args);
				logger.debug("[``preparee``] Creating ``args.rest.first ``from`` args.rest.rest.first else "null"``");
				assert(is Result result=preparee.create(*args));
				logger.debug("[``preparee``] Created ``result else "null" ``from`` args.rest.rest.first else "null"``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matchable) then Matcher { 
			classificator = classificator;
			priority = matchable.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Source,Class<ResultType>] args) {
					result= matchable.predicate(*args);
				}
				else{
					result =false;
				}
				logger.trace("``matchingResultLog(result)``, for ``preparee``, Args:``args``  ");
				return result;
			}
			
			
		}
		else Hasher{ 
			classificator = classificator; 
			toHash = [typeLiteral<Source>(),typeLiteral<Result>()];
		};
		
		return [classificable,transformation];
	}
	
	shared actual [Classificable,Transformation] resolvance<Source, Result, ResultType>(Resolvance<Source,Result,ResultType> preparee, Matchable<Source,ResultType>? matchable)
			given ResultType satisfies Type<Result> {
		
		Classificator classificator=resolver;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("[``preparee``] Resolving ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				assert(is Result result=preparee.resolve(*args));
				logger.debug("[``preparee``] Resolved ``args.rest.first else "null"`` to ``result``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matchable) then Matcher { 
			classificator = classificator;
			priority = matchable.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Source,ResultType] args) {
					result= matchable.predicate(*args);
				}
				else{
					result =false;
				}
				logger.trace("``matchingResultLog(result)``, for ``preparee``, Args:``args``  ");
				return result;
			}
			
			
		}
		else Hasher{ 
			classificator = classificator; 
			toHash = [typeLiteral<Source>(),typeLiteral<Result>()];
		};
		
		return [classificable,transformation];
	}
	shared actual Anything mapping<Source, ResultType>(Mapping<Source,ResultType> preparee, Matchable<Source,ResultType>? matchable)
			given ResultType satisfies Type<Anything> {
		Classificator classificator=mapper;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Source,ResultType] args);
				logger.debug("[``preparee``] Mapping ``args.first else "null"`` to ``args.rest.first``");
				assert(is Result result=preparee.map(*args));
				logger.debug("[``preparee``] Mapped ``args.first else "null"`` to ``result``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matchable) then Matcher { 
			classificator = classificator;
			priority = matchable.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Source,ResultType] args) {
					result= matchable.predicate(*args);
				}
				else{
					result =false;
				}
				logger.trace("``matchingResultLog(result)``, for ``preparee``, Args:``args``  ");
				return result;
			}
			
			
		}
		else Hasher{ 
			classificator = classificator; 
			toHash = [typeLiteral<Source>(),typeLiteral<ResultType>()];
		};
		
		return [classificable,transformation];
	}
	
	

	
}