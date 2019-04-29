import ceylon.collection {
	ArrayList,
	HashSet
}
import ceylon.language.meta {
	type
}
import ceylon.json {
	JsonObject,
	JsonArray
}

shared object testData {
	shared String name = "Test Name";
	shared Integer id = 123;
	shared Null nullVal = null;
	shared SimpleModel simpleModel = SimpleModel(name, id, nullVal);
	shared JsonObject simpleModelJsonObject = JsonObject {
		`nullVal`.declaration.name->null,
		`name`.declaration.name->name,
		`id`.declaration.name->id
	};
	
	shared JsonArray simpleJsonArrayWithNull = JsonArray({ name, id, nullVal });
	shared JsonArray simpleJsonArray = JsonArray({ name, id });
	shared List<String|Integer|Null> simpleListWithNull = ArrayList<String|Integer|Null> {
		elements = { name, id, nullVal };
	};
	shared Array<String|Integer|Null> simpleArrayWithNull = Array<String|Integer|Null> {
		elements = { name, id, nullVal };
	};
	
	shared Set<String|Integer> simpleSet = HashSet<String|Integer> {
		elements = { name, id };
	};
	shared {String|Integer*} simpleStream = { name, id };
	shared [String|Integer*] simpleSequence = [name, id];
	shared [String, Integer] simpleTuple = [name, id];
	
	shared TypeResolveOne resolveOne = TypeResolveOne(name);
	shared TypeResolveTwo resolveTwo = TypeResolveTwo(id);
	
	shared ResolvableClass resolvable = ResolvableClass(resolveTwo);
	
	shared JsonObject resolveOneJsonObject = JsonObject {
		values = {
			`TypeResolveOne.type`.declaration.name->type(resolveOne.type).declaration.name,
			`TypeResolveOne.text`.declaration.name->resolveOne.text
		};
	};
	
	shared JsonObject resolveTwoJsonObject = JsonObject {
		values = {
			`TypeResolveTwo.type`.declaration.name->type(resolveTwo.type).declaration.name,
			`TypeResolveTwo.id`.declaration.name->resolveTwo.id
		};
	};
	
	shared JsonObject resolvableJsonObject = JsonObject {
		values = {
			`ResolvableClass.resolved`.declaration.name->resolveTwoJsonObject
		};
	};
}
