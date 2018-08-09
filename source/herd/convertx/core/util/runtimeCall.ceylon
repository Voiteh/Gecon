import ceylon.language.meta.model {
	Type
}
shared object runtimeCall {
	
	shared object iterable{
		value narrowRef = `function Iterable.narrow`;
		
		shared {Anything*} narrow({Anything*} container,Type<> narrowTo){
			value apply = narrowRef.memberInvoke(container,[narrowTo]);
			assert(is {Anything*} apply);
			return apply;
		}
		
		
		
		
	}
	
	
}