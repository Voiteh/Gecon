
"Defines the convention of [[Mapping]]. When converting one object (source) to another (result), 
 it is required sometimes to define relation between parts of source and result. 
 This interface allows that providing one to one mapping between those parts "
shared interface Mapping {
	
	"Mappings between source and result parts"
	shared formal {<Object->Anything>*} mappings;
	
}