import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta.declaration {
	ValueDeclaration
}
import herd.convertx.core.api.meta {
	Targetable
}
shared class MetaTargetable(declaration,type) satisfies Targetable {
	shared actual ValueDeclaration declaration;
	
	shared actual Type<Anything> type;
	
}