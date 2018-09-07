import ceylon.language.meta {
	type
}
import herd.convertx.core.api.component {
	Resolver
}
import herd.convertx.json {
	JSONObject
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
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
		} else {
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
	
	shared actual Boolean equals(Object that) {
		if (is TypeResolveOne that) {
			return type==that.type &&
					text==that.text;
		} else {
			return false;
		}
	}
	shared actual Integer hash {
		variable value hash = 1;
		hash = 31*hash + type.hash;
		hash = 31*hash + text.hash;
		return hash;
	}
	shared actual String string => super.string;
}

shared serializable
class TypeResolveTwo(id) satisfies TypeResolveInterface {
	shared actual DataType type = typeTwo;
	shared Integer id;
	
	shared actual Boolean equals(Object that) {
		if (is TypeResolveTwo that) {
			return type==that.type &&
					id==that.id;
		} else {
			return false;
		}
	}
	shared actual Integer hash {
		variable value hash = 1;
		hash = 31*hash + type.hash;
		hash = 31*hash + id;
		return hash;
	}
}

shared serializable
class ResolvableClass(resolved) {
	shared TypeResolveInterface resolved;
}

shared class JSONObjectToTestResolveInterfaceResolver() satisfies Resolver<TypeResolveInterface,JSONObject> {
	shared actual Class<TypeResolveInterface,Nothing> resolve(Context context, JSONObject input, ClassOrInterface<TypeResolveInterface> outputType) {
		value typeInfo = input.get(`TypeResolveInterface.type`.declaration.name);
		value dataType = context.convert(typeInfo, `DataType`);
		switch (dataType)
		case (typeOne) {
			return `TypeResolveOne`;
		}
		case (typeTwo) {
			return `TypeResolveTwo`;
		}
	}
	matcher => object satisfies JSONObjectToTestResolveInterfaceResolver.Matcher {
		shared actual Boolean match(JSONObject input, ClassOrInterface<TypeResolveInterface> outputType) => true;
		
		shared actual Integer priority => 1;
	};
}
