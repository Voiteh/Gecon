import ceylon.collection {
	HashMap
}
import herd.convertx.core.operations {
	Findable,
	Executable
}



shared class Container() extends HashMap<Findable, Executable>(){}