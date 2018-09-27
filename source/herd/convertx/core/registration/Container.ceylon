import ceylon.collection {
	HashMap
}
import herd.convertx.core.operation {
	Findable,
	Executable
}



shared class Container() extends HashMap<Findable, Executable>(){}