import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta.declaration {
	ValueDeclaration
}
import herd.convertx.core.api.meta {
	Part,
	Targetable,
	Obtainable
}

shared class MetaPart(Anything obtainableData, ValueDeclaration targetableDeclartion, Type<> targetableType) satisfies Part {
	
	shared actual Obtainable obtainable = object satisfies Obtainable {
		shared actual Anything obtain = obtainableData;
	};
	shared actual Targetable targetable = MetaTargetable(targetableDeclartion, targetableType);
}
