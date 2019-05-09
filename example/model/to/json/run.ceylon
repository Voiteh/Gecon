import herd.gecon.core.engine {

	AutoProvider,
	Gecon,
	ScopeProvisioning
}
import ceylon.json {

	JsonObject
}
serializable class SimpleModel(shared Boolean boolVal, shared String strVal, shared Float floatVal) {
	shared actual String string => "boolValue:``boolVal``, strVal:``strVal`` floatVal:``floatVal``";
}


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
	value simpleModel =SimpleModel(false, "test", 0.123);
	value jsonObject = gecon.transform(simpleModel, `JsonObject`);
	value json= gecon.transform(jsonObject, `String`);
	print("Here You go: ``json``");
}