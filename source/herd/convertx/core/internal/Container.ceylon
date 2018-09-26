import ceylon.collection {
	HashMap
}
import herd.convertx.api.registration {
	Executable,
	Findable
}
shared class Container() extends HashMap<Findable, Executable>(){}