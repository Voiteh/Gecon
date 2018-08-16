import ceylon.json{
	Object,Array
}
shared alias JSONValue=>String|Boolean|Integer|Float|Object|Array|Null;
shared class JSONObject({<String->JSONValue>*} values)=>Object(values);
shared class JSONArray({JSONValue*} values) =>Array(values);
