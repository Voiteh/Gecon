import ceylon.language.meta {
	type
}

shared serializable
class SimpleModel(
	shared String name,
	shared Integer id,
	shared Null nullVal) {
	
	shared actual String string => "``type(this).declaration.name`` - id: ``id``, name: ``name``";
	
	
	shared actual Boolean equals(Object that) {
		if (is SimpleModel that) {
			return name==that.name && 
				id==that.id;
		}
		else {
			return false;
		}
	}
	shared actual Integer hash {
		variable value hash = 1;
		hash = 31*hash + name.hash;
		hash = 31*hash + id;
		return hash;
	}
}

shared abstract class DataType() of typeOne | typeTwo {}
shared object typeOne extends DataType() {}
shared object typeTwo extends DataType() {}

shared interface TypeResolveInterface {
	shared formal DataType type;
}

shared serializable
class TypeResolveOne(text) satisfies TypeResolveInterface {
	shared actual DataType type = typeOne;
	shared String text;
}

shared serializable
class TypeResolveTwo(id) satisfies TypeResolveInterface {
	shared actual DataType type = typeTwo;
	shared Integer id;
}

shared serializable
class ResolvableClass(resolved) {
	shared TypeResolveInterface resolved;
}
