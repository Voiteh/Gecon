
import herd.convertx.core.api.registration {
	Executable,
	Findable,
	Visitor
}


shared interface Component of TypedConverter<> | TypedResolver<> | TypedCreator<> {
	shared formal [Findable,Executable] flatten(Visitor visitor);
}
