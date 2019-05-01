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

import herd.gecon.api.transformer {
	Registrable,
	Delegator,
	Relation,
	Mapper,
	Converter,
	Creator,
	Resolver
}
import herd.gecon.engine.internal.clasification {
	Classificable,
	Classificator,
	creator=creation,
	resolver=resolvance,
	converter=convertion,
	relator=mapping,
	GenericMatcher,
	Hasher
}
import herd.gecon.api.dictionary {
	Dictionary
}
shared class TransformationAdapter(Logger logger) satisfies Registrable.Adapter{
		
	String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";
	
	shared actual [Classificable,Transformation] conversion<Source, Result, ResultType>(Converter<Source,Result,ResultType> preparee)
			given ResultType satisfies Type<Result> {
		
		Classificator classificator=converter;
		
		Transformation transformation= object satisfies Transformation{
				shared actual Result transform<Result>(Anything[] args) {
					assert(is [Delegator,Source,ResultType] args);
					logger.debug("|Convertion| [``preparee``] Converting ``args.rest.first else "null"`` to ``args.rest.rest.first``");
					assert(is Result result=preparee.convert(*args));
					logger.debug("|Convertion| [``preparee``] Converted ``args.rest.first else "null"`` to ``result else "null"``");
					return result;
					
				}
				
				string => preparee.string;
				
		};
			Classificable classificable= if(exists matcher=preparee.matcher) then GenericMatcher { 
				classificator = classificator;
				priority = matcher.priority;
				
				Boolean match(Anything[] args){
					Boolean result;	
					if (is [Source,ResultType] args) {
						result= matcher.predicate(*args);
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
	
	shared actual [Classificable,Transformation] creation<Source, ResultType>(Creator<Source,ResultType> preparee) {
		Classificator classificator=creator;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Source,Class<ResultType>] args);
				logger.debug("|Creation| [``preparee``] Creating ``args.rest.rest.first `` from `` args.rest.first else "null"``");
				assert(is Result result=preparee.create(*args));
				logger.debug("|Creation| [``preparee``] Created ``result else "null" ``from`` args.rest.first else "null"``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matcher =preparee.matcher) then GenericMatcher { 
			classificator = classificator;
			priority = matcher.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Source,Class<ResultType>] args) {
					result= matcher.predicate(*args);
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
	
	shared actual [Classificable,Transformation] resolvance<Source, Result, ResultType>(Resolver<Source,Result,ResultType> preparee)
			given ResultType satisfies Type<Result> {
		
		Classificator classificator=resolver;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("|Resolvance| [``preparee``] Resolving ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				assert(is Result result=preparee.resolve(*args));
				logger.debug("|Resolvance| [``preparee``] Resolved ``args.rest.first else "null"`` to ``result``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matcher =preparee.matcher) then GenericMatcher { 
			classificator = classificator;
			priority = matcher.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Source,ResultType] args) {
					result= matcher.predicate(*args);
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
	shared actual Anything mapping<Source, ResultType, Dict>(Mapper<Source,ResultType,Dict> preparee)
			given Source satisfies Object
			given Dict satisfies Dictionary<Object,Anything>
	{
		Classificator classificator=relator;
		value dicitonaryType = `given Dict`;
		Transformation transformation= object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Relation<Source,ResultType>] args);
				
				logger.debug("|Mapping| [``preparee``] Mapping ``args.first`` to ``dicitonaryType.satisfiedTypes``");
				assert(is Result result=preparee.map(*args));
				logger.debug("|Mapping| [``preparee``] Mapped ``args.first `` to ``result ``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		Classificable classificable= if(exists matcher=preparee.matcher) then GenericMatcher { 
			classificator = classificator;
			priority = matcher.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Relation<Source,ResultType>,Class<Dict>] args) {
					result= matcher.predicate(*args);
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