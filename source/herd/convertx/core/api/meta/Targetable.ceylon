import ceylon.language.meta.model {
	Type
}
shared interface Targetable {
	shared formal Type<> type;
	shared formal Anything declaration;
}