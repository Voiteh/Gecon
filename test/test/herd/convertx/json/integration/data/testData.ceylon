
import herd.convertx.json {
	JSONObject,
	JSONArray
}
import ceylon.collection {
	ArrayList,
	HashSet
}

shared object testData {
	
	
	shared String name = "Test";
	shared Integer id = 123;
	shared Null nullVal = null;
	shared SimpleModel simpleModel = SimpleModel(name, id, nullVal);
	shared JSONObject simpleModelJSONObject = JSONObject {
		values = {
			`nullVal`.declaration.name->null,
			`name`.declaration.name->name,
			`id`.declaration.name->id
		};
	};
	
	shared JSONArray simpleJSONArrayWithNull = JSONArray({ name, id, nullVal });
	shared JSONArray simpleJSONArray = JSONArray({ name, id });
	shared List<Anything> simpleListWithNull = ArrayList<Anything> {
		elements = { name, id, nullVal };
	};
	shared Array<Anything> simpleArrayWithNull = Array<Anything> {
		elements = { name, id, nullVal };
	};
	
	shared Set<Object> simpleSet = HashSet<Object> {
		elements = { name, id };
	};
	shared {Object*} simpleStream = { name, id };
	shared [Object*] simpleSequence = [name, id];
	shared [String, Integer] simpleTuple = [name, id];
	
	shared TypeResolveOne resolveOne = TypeResolveOne(name);
	shared TypeResolveTwo resolveTwo = TypeResolveTwo(id);
	
	shared ResolvableClass resolvable = ResolvableClass(resolveTwo);
	
	shared JSONObject resolveOneJSONObject = JSONObject {
		values = {
			`TypeResolveOne.type`.declaration.name->resolveOne.type.string,
			`TypeResolveOne.text`.declaration.name->resolveOne.text
		};
	};
	
	shared JSONObject resolveTwoJSONObject = JSONObject {
		values = {
			`TypeResolveTwo.type`.declaration.name->resolveTwo.type.string,
			`TypeResolveTwo.id`.declaration.name->resolveTwo.id
		};
	};
	
	shared JSONObject resolvableJSONObject = JSONObject{
		values={
			`ResolvableClass.resolved`.declaration.name -> resolveTwoJSONObject
		};
	};
}
