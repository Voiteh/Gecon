import ceylon.collection {
	MutableList
}
shared serializable class InteresectionModel(data){ 

		shared MutableList<String>&SearchableList<String> data;
	
}

shared serializable class MatchingIntersection(data){
	shared {Integer*} data; 
}

shared abstract class EnumOne() of first | second | third | fourth {}
shared object first extends EnumOne() {}
shared object second extends EnumOne() {}
shared object third extends EnumOne() {}
shared object fourth extends EnumOne() {}

shared interface EnumTwo of one | two | three {}
shared object one satisfies EnumTwo {}
shared object two satisfies EnumTwo {}
shared object three satisfies EnumTwo {}

shared serializable
class TestSimpleModel(id, name) {
	shared Integer id;
	shared String name;
	
	shared actual Boolean equals(Object that) {
		if (is TestSimpleModel that) {
			return id==that.id &&
					name==that.name;
		} else {
			return false;
		}
	}
	shared actual Integer hash {
		variable value hash = 1;
		hash = 31*hash + id;
		hash = 31*hash + name.hash;
		return hash;
	}
}

shared serializable
class TestOtherSimpleModel(id, name) {
	shared String id;
	shared Integer name;
	
	shared actual Boolean equals(Object that) {
		if (is TestOtherSimpleModel that) {
			return id==that.id &&
					name==that.name;
		} else {
			return false;
		}
	}
	shared actual Integer hash {
		variable value hash = 1;
		hash = 31*hash + id.hash;
		hash = 31*hash + name;
		return hash;
	}
}