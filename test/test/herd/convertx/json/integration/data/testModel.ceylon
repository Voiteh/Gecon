shared serializable
class SimpleModel(
	shared String name,
	shared Integer id,
	shared Null nullVal) {}

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
