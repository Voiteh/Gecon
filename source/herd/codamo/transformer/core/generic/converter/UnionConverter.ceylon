import ceylon.language.meta.model {
	UnionType
}

import herd.codamo.api.core.transformer {
	Converter,
	TransformationError,
	Delegator,
	TransformationFindingError
}

"Converts Source object into Result union type. The result type object will be first convertable type of union.
 
 Example:
 
 Let say there is provided [[UnionConverter]], [[String]] to [[Integer]] converter and [[String]] to [[Float]] converter, to Codamo instance.
  
 There is need to convert (convertable) [[String]] value into union type [[Integer|Float]]. 
 
 Depending how order of types in union ([[Integer|Float]], [[Float|Integer]]) is defined the result will differ. 
 
 Codamo codamo=...;
 
 String source= \"2.0\";
 
 assert(is Integer result=codamo.convert(source,\`Integer|Float\`));
 
 assert(is Float result=codamo.convert(source,\`Float|Integer\`));
 
"
tagged ("Generic")
by ("Wojciech Potiopa")
shared class UnionConverter() extends Converter<Anything,Anything,UnionType<>>() {
	shared actual Anything convert(Delegator delegator, Anything source, UnionType<> resultType) {
		for (value type in resultType.caseTypes) {
			try {
				return delegator.convert(source, type);
			} catch (TransformationError|TransformationFindingError x) {}
		}
		throw Error(source, resultType, Exception("All converters for types: ``resultType.caseTypes`` failed"));
	}
	
	shared actual Matcher matcher => Matcher {
		predicate(Anything source, UnionType<Anything> resultType) => true;
		
		Integer priority = 1;
	};
}
