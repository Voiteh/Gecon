import ceylon.collection {
	HashMap
}

import herd.gecon.core.engine.internal.clasification {
	Classificable
}



"Container for [[Classificable]]s and [[Transformation]]s"
shared class Container() extends HashMap<Classificable, Transformation>(){}