"""Core API module for the Codamo framework. Provides stable API for transformations of data models. Available transformations:
   - Conversion - Initial entry point for conversion, takes source object and converts it into result type object. 
   Whole flow can be implemented using single Conversion or it can delegate to other transformations. 
   Default implementation of this interface is Converter which should be used for defining Conversion.
   	 	
   	 
   - Resolvance - Chooses implementation of specific interface, abstract class, or any other type which is ambigous in compile time. 
   The most common use case is selecting collection implementation for interface like List<String>. 
   Should this be LinkedList<String> , or maybe ArrayList<String> ? 
   This is handled by implementaton of Resolvance interface.
   Default implementation of this interface is Resolver which should be used for defining Resolvance.

   - Creation - Creates specific result type object from provided result type and arguments. 
   Creation can be undestood as a constructor / initializer. 
   In cases where conversion is generic and type arguments are not available in compile type it is sometimes usefull to delegate to Creation. 
   Default implementation of this interface is Creator which should be used for defining Creation.
   	 
   - Mapping - Maps result type parts to source parts values using Dictionary object. 
   Default implementation of this interface is Mapper, which should be used for defining Mapping. 
   Example usecase is when converting from json to model object and the naming of fields are different in model than in json.
"""
by("Wojciech Potiopa")
module herd.gecon.core.api "0" {
	import herd.type.support "0.1.0";
}
