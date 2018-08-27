import herd.convertx.core.api.component {
	Creator
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Class,
	Attribute
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.collection {
	HashMap
}
shared abstract class AttributeMapper<Source,Result>()
		 satisfies Creator<AttributePartialization,Source->ClassOrInterface<Result>> given Source satisfies Object{
	shared formal {<Attribute<Source>->Attribute<Result>>*} relations;
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Source->ClassOrInterface<Result> arguments) {
		value entries=relations.map((Attribute<Source,Anything,Nothing> sourceAttribute -> Attribute<Result,Anything,Nothing> destAttribute) {
			value sourcePartValue=sourceAttribute.bind(arguments.key).get();
			value resultPartValue=context.convert(sourcePartValue,destAttribute.type);
			return destAttribute->resultPartValue;
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
}