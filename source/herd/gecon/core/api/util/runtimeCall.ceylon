import ceylon.language.meta.model {
	Type
}

"Runtime call provider object"
shared object runtimeCall {
	
	"Iterable related object"
	shared object iterable{
		"narrow function reference"
		value narrowRef = `function Iterable.narrow`;
		"[[{}.narrow]] runtime equivalent"
		shared {Result*} narrow<Result=Anything>({Anything*} container,Type<Result> narrowTo){
			value apply = narrowRef.memberInvoke(container,[narrowTo]);
			assert(is {Result*} apply);
			return apply;
		}
		
		
		
		
	}
	
	
}