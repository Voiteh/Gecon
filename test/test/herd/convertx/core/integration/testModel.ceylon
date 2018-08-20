import ceylon.collection {
	MutableList
}
shared serializable class InteresectionModel(data){ 

		shared MutableList<String>&SearchableList<String> data;
	
}

shared serializable class MatchingIntersection(data){
	shared {Integer*} data; 
}