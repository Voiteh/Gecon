import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.logicals {
	Findable,
	Executable
}
shared class Container() extends HashMap<Findable, Executable>(){}