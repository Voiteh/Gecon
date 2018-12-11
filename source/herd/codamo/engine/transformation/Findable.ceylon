"A findable interface"
shared interface Findable of Hashable|Matchable{}

"Findable implemtatnion"
shared interface Hashable satisfies Findable{
	shared formal actual Integer hash;
	shared formal actual Boolean equals(Object other);
}
"Findable implementation"
shared interface Matchable satisfies Findable{
	shared formal Boolean match(Anything[] args);
	
	shared formal Integer priority;
}


