import ceylon.language.meta.model {
	Type
}
shared object runtimeCall {
	
	shared object iterable{
		value narrowRef = `function Iterable.narrow`;
		
		shared {Result*} narrow<Result=Anything>({Anything*} container,Type<Result> narrowTo){
			value apply = narrowRef.memberInvoke(container,[narrowTo]);
			assert(is {Result*} apply);
			return apply;
		}
		
		
		
		
	}
	
	
}