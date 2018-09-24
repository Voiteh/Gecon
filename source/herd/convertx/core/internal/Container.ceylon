import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.registration {
	Executable,
	Findable
}
shared class Container() extends HashMap<Findable, Executable>(){}