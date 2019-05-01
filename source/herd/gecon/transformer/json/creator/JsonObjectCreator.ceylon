import ceylon.json {
	JsonObject,
	Value
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.api.transformer {
	Creator,
	Delegator
}
import herd.gecon.api.dictionary {
	KeyToValueDictionary
}

"Creates [[JsonObject]] out of [[KeyToValueDictionary]]"
by ("Wojciech Potiopa")
shared class JsonObjectCreator() extends Creator<KeyToValueDictionary,JsonObject>() {
	shared actual JsonObject create(Delegator delegator, KeyToValueDictionary arguments, Class<JsonObject,Nothing> kind) => JsonObject {
		values = arguments.map((String elementKey -> Anything elementItem) {
			if(is Value elementItem){
				return elementKey -> elementItem;
			}else{
				return elementKey -> delegator.convert(elementItem,`Value`);
			}
		});
	};
}
