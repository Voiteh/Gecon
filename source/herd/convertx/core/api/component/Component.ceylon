
import herd.convertx.core.api.registration {
	Executable,
	Findable,
	Visitor
}
import ceylon.language.meta {
	type
}


shared interface Component of TypedConverter<> | TypedResolver<> | TypedCreator<> {
	shared formal [Findable,Executable] flatten(Visitor visitor);
	
	string => "``type(this).declaration.name``";
	
}
