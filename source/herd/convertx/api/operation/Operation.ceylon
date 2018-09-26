import herd.convertx.api.registration {
	Executable,
	Findable,
	Visitor
}
import ceylon.language.meta {
	type
}



shared sealed interface Operation of Convertion<> | Resolvance<> | Creation<> {
	
	shared formal [Findable,Executable] flatten(Visitor visitor);
	
	string => "``type(this).declaration.name``";
	
}
