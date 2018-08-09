import ceylon.collection {
	HashMap
}

import herd.convertx.core.api.meta {
	Accumulator,
	Targetable,
	AccumulationException
}
shared class MetaAccumulator() satisfies Accumulator {
	value accumulatee=HashMap<MetaTargetable,Anything >();
	shared Map<MetaTargetable,Anything> accumulated=accumulatee;
	
	shared actual AccumulationException? accumulate(Targetable targetable, Anything data) {
		if(is MetaTargetable targetable){
			accumulatee.put(targetable,data);
			return null;
		}
		else{
			return AccumulationException(targetable,data);
		}
	}
	
}