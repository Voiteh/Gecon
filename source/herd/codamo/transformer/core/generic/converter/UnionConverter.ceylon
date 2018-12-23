import ceylon.language.meta.model {
	UnionType,
	Type
}


import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Convertion,
	TransformationError,
	ConvertionError,
	Delegator,
	ComponentFindingError
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
tagged("Generic")
by("Wojciech Potiopa")
shared provided class UnionConverter() satisfies Converter<Anything,Anything>{
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		assert(is UnionType<Anything> resultType);
		for(value type in resultType.caseTypes){
			try {
				return delegator.convert(source, type);
			} catch (TransformationError|ComponentFindingError x) {}
		}
		throw ConvertionError(source, resultType,Exception("All converters for types: ``resultType.caseTypes`` failed"));
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is UnionType<>;
		
		shared actual Integer priority = 1;

	};
	
}
