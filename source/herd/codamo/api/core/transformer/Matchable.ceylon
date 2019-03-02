import ceylon.language.meta.model {
	Type
}
"Provides possiblity for loose predict, wheter provided arguments matches given [[predicate]]. 
 Improves relalebiity providing [[priority]]. 
 Used to deremine loosely if transformation arguments matches given transformation"
shared interface Matchable<Source,  ResultType> given ResultType satisfies Type<>{
	"Indicates wheter given [[Source]] and [[ResultType]] are usable for transformation"
	shared formal Boolean predicate(Source source, ResultType resultType);
	"Whenever same predicate is used, indicates which one should be choosen by algorithm. 
	 The higher value, more liekly it will be choosen (by default start from 0) "
	shared formal Integer priority ;
}
