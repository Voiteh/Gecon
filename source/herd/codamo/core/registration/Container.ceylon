import ceylon.collection {
	HashMap
}
import herd.codamo.core.operation {
	Findable,
	Executable
}



shared class Container() extends HashMap<Findable, Executable>(){}