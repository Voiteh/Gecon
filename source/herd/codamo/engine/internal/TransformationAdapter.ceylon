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
	Conversion,
	Resolvance,
	Creation,
	Matchable,
	Delegator,
	Mapping,
	Relation
}
import herd.codamo.engine.internal.clasification {
	Classificable,
	Classificator,
	creator=creation,
	resolver=resolvance,
	converter=convertion,
	relator=mapping,
	Matcher,
	Hasher
}
import herd.codamo.api.core.dictionary {
	Dictionary
}
shared class TransformationAdapter(Logger logger) satisfies Registrable.Adapter{
		
	String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";
	
	shared actual [Classificable,Transformation] conversion<Source, Result, ResultType>(Conversion<Source,Result,ResultType> preparee, Matchable<Source,ResultType>? matchable)
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
				assert(is [Delegator,Source,Class<ResultType>] args);
				logger.debug("|Creation| [``preparee``] Creating ``args.rest.rest.first `` from `` args.rest.first else "null"``");
				assert(is Result result=preparee.create(*args));
				logger.debug("|Creation| [``preparee``] Created ``result else "null" ``from`` args.rest.first else "null"``");
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
				logger.debug("|Resolvance| [``preparee``] Resolving ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				assert(is Result result=preparee.resolve(*args));
				logger.debug("|Resolvance| [``preparee``] Resolved ``args.rest.first else "null"`` to ``result``");
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
	shared actual Anything mapping<Source, ResultType, Dict>(Mapping<Source,ResultType,Dict> preparee, Matchable<Relation<Source,ResultType>,Class<Dict,Nothing>>? matchable)
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
		Classificable classificable= if(exists matchable) then Matcher { 
			classificator = classificator;
			priority = matchable.priority;
			
			Boolean match(Anything[] args){
				Boolean result;	
				if (is [Relation<Source,ResultType>,Class<Dict>] args) {
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