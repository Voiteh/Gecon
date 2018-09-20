import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.component {
	Executable,
	Findable
}
shared class Container() extends HashMap<Findable, Executable>(){}