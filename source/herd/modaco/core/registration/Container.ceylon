import ceylon.collection {
	HashMap
}
import herd.modaco.core.operation {
	Findable,
	Executable
}



shared class Container() extends HashMap<Findable, Executable>(){}