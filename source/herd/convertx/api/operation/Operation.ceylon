import ceylon.language.meta {
	type
}

import herd.convertx.api.flattening {
	Findable,
	Executable,
	Visitor
}



shared sealed interface Operation of Convertion<> | Resolvance<> | Creation<> {
	
	shared formal [Findable,Executable] flatten(Visitor visitor);
	
	string => "``type(this).declaration.name``";
	
}
