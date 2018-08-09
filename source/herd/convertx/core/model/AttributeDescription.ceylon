
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.meta.support {
	MetaPart,
	MetaAccumulator
}
import herd.convertx.core.api.meta {
	Description,
	Accumulator
}

shared class AttributeDescription(parts) satisfies Description {
	shared actual MetaPart[] parts;
	shared actual Class<Accumulator,Nothing> accumulatorClass = `MetaAccumulator`;
	
	
}
