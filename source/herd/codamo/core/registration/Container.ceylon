import ceylon.collection {
	HashMap
}
import herd.codamo.core.operation {
	Findable,
	Executable
}


"Container for [[Findable]]s and [[Executable]]s"
shared class Container() extends HashMap<Findable, Executable>(){}