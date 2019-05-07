# Gecon
GEneric CONverter of data models for Ceylon. This framework is created to ease everyday tasks regarding conversion between models. It is not directed to one of specific use case, like json <-> model conversion, but can be used in many. 


## Guide
The main feature of this framework is delegation of responsibility. There is interface called `Delegator` accessible for all transformations. It allows to pass responsibility to other `Transformation`'s implementation? What is `Transformation`? A `Transformation` implementation is an object which takes source object and changes it into result type object.   
Transformations are categorized as: 

- `Conversion` - Initial entry point for conversion, takes source object and converts it into result type object. Whole flow can be implemented using single `Conversion` or it can delegate to other transformations. Default implementation of this interface is `Converter` which should be used for defining `Conversion`.

- `Resolvance` - Chooses implementation of specific interface, abstract class, or any other type which is ambigous in compile time. The most common use case is selecting collection implementation for interface like `List<String>`. Should this be `LinkedList<String>` , or maybe `ArrayList<String>`? This is handled by implementaton of `Resolvance` interface. Default implementation of this is nterface is `Resolver` which should be used for defining `Resolvance`. 

- `Creation` - Creates specific result type object from provided result type and arguments. `Creation` can be undestood as a constructor / initializer. In cases where conversion is generic and type arguments are not available in compile type it is sometimes usefull to delegate to `Creation`. Default implementation of this interface is `Creator` which should be used for defining `Creation`.

- `Mapping` - Maps result type parts to source parts values using `Dictionary` object. Default implementation of this interface is `Mapper`, which should be used for defining `Mapping`. Example usecase is when converting from json to model object and the naming of fields are different in model than in json. 



## Examples
All examples in `example` source folder. 
Examples definitions:
* Json to Model conversion - `module json.to.model`
* Model to Json conversion - `module model.to.json`

## Versioning

The versioning of this project starts from 0. Is defined as referenced to version of `herd.gecon.core.api` module as a base, which is defined as CORE-API . Other modules should define it's version, based on this versioning so version of `herd.gecon.core.engine` module will be defined as CORE-API.ENGINE . If a module have it's own API. the versioning for this module will be CORE-API.OTHER-API.MODULE . Change in any API version may mean it is a compatibility break. 

|             Module name             |  Versioning pattern  | Current version |
|:-----------------------------------:|:--------------------:|:---------------:|
| `herd.gecon.core.api`               |       CORE_API       |        0        |
| `herd.gecon.core.engine`            |    CORE_API.ENGINE   |       0.0       |
| `herd.gecon.core.trnasformer`       | CORE_API.TRANSFORMER |       0.0       |
| `herd.gecon.collection.transformer` | CORE_API.TRANSFORMER |       0.0       |
| `herd.gecon.json.transformer`       | CORE_API.TRNASFORMER |       0.0       |
| `herd.gecon.test.extension`         |       EXTENSION      |        0        |
