import ceylon.collection {
	HashMap
}
import herd.codamo.engine.transformation {
	Findable,
	Executable
}


"Container for [[Findable]]s and [[Executable]]s"
shared class Container() extends HashMap<Findable, Executable>(){}