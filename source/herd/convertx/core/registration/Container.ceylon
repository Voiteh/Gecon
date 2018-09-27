import ceylon.collection {
	HashMap
}
import herd.convertx.api.flattening {
	Executable,
	Findable
}



shared class Container() extends HashMap<Findable, Executable>(){}