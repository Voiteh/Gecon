import herd.gecon.core.engine {
	Gecon,
	AutoProvider,
	ScopeProvisioning
}
import ceylon.json {
	JsonObject
}
"Simple model for deserialization"
serializable class SimpleModel(shared Boolean boolVal, shared String strVal, shared Integer intVal) {
	shared actual String string => "boolValue:``boolVal``, strVal:``strVal`` intVal:``intVal``";
}
String json ="{
              \"boolVal\": true,
              \"strVal\": \"test\",
              \"intVal\": 123
              }";
"Run the module `usage.example`."
shared void run() {
	value gecon = Gecon {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[
					`module herd.gecon.core.transformer`,
					`module herd.gecon.json.transformer`
				]
			);
		};
	};
	value jsonObject = gecon.convert(json, `JsonObject`);
	value model= gecon.convert(jsonObject, `SimpleModel`);
	print("Here You go: {``model``}");
}

