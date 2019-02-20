import ceylon.logging {
	Logger
}

import herd.codamo.api.core.transformer {
	Registrable,
	Convertion,
	Resolvance,
	Creation,
	Matchable,
	Delegator
}
import herd.codamo.engine.internal.clasification {
	Classificable,
	Classificator,
	creation,
	resolvance,
	Matcher,
	Hasher
}
import ceylon.language.meta.model {
	Class
}
import ceylon.language.meta {
	typeLiteral
}
shared class TransformationAdapter(Logger logger) satisfies Registrable.Adapter{
	
	String matchingResultLog(Boolean result) =>"Matching ``if (result) then "SUCCESS" else "FAILURE"``";

	shared actual [Classificable,Transformation] adapt<Source, Result, ResultType>(Convertion<Source,Result,ResultType>|
		Resolvance<Source,Result,ResultType>|
			Creation<Source,Result,Result> preparee,
	 Matchable<Source,ResultType>? matchable)
	given ResultType satisfies Object{
		
	Classificator classificator;
	Transformation transformation;
	switch(preparee)
	case (is Convertion<Source,Result,ResultType>) {
		classificator=creation;
		transformation = object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("[``preparee``] Converting ``args.rest.first else "null"`` to ``args.rest.rest.first``");
				assert(is Result result=preparee.convert(*args));
				logger.debug("[``preparee``] Converted ``args.rest.first else "null"`` to ``result else "null"``");
				return result;
				
			}
			
			string => preparee.string;
			
		};
		
	}
	else case (is Resolvance<Source,Result,ResultType>) {
		classificator=resolvance;
		transformation = object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				assert(is [Delegator,Source,ResultType] args);
				logger.debug("[``preparee``] Resolving ``args.rest.first else "null" ``, to ``args.rest.rest.first``");
				assert(is Result result=preparee.resolve(*args));
				logger.debug("[``preparee``] Resolved ``args.rest.first else "null"`` to ``result``");
				return result;
				
			}
			string => preparee.string;
			
			
		};
	}
	else case (is Creation<Source,Result,ResultType>) {
		classificator=creation;
		transformation = object satisfies Transformation{
			shared actual Result transform<Result>(Anything[] args) {
				
				assert(is [Delegator,Class<ResultType>, Source] args);
				logger.debug("[``preparee``] Creating ``args.rest.first``, using arguments: ``args.rest.rest.first else "null"``");
				assert(is Result result= preparee.create(*args));
				logger.debug("[``preparee``] Created ``result else "null"``, using arguments: ``args.rest.rest.first else "null"``");
				return result;
			}
			
			string => preparee.string;
		};
	}
	else {
		throw Exception("Unknown transformation ``preparee``");
	}

	Classificable classificable;	
	if(exists matchable){
		classificable=Matcher { 
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
			
			
		};
	}
	else{
		classificable=Hasher{ 
			classificator = classificator; 
			toHash = [typeLiteral<Source>(),typeLiteral<Result>()];
		};
	}
	
	
	return [classificable,transformation];
	}
}