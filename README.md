# Gecon - GEneric CONverter of data models for Ceylon
This framework is created to ease everyday tasks regarding conversion between models. It is not directed to one of specific use case like json <-> model conversion but can be used in many. 


## Guide

To make use of this framework there is need to instantiate `Gecon` type object.
```ceylon
Gecon gecon = Gecon{
  provider = AutoProvider {
    transformations = ScopeProvisioning {
      scopes = [
        `module herd.gecon.core.transformer`,
	`module herd.gecon.collection.transformer`,
	`module herd.gecon.json.transformer`
      ];
    };
  };
};
```
This is minimal setup which is required for usage. Modules registered in this guide are providing required `Transformation`s for:
- Basic data types 
- Generic data types
- Collections
- Json <-> Model

There is only one instantiation parameter used, it is `provider`. It tells framework, on what components it will work on. Currently only `Transformation`s can be provided. `AutoProvider` is used for such purpose. It is working on scope based filtering. Basically it takes `Transformation` classes, begin available via `scopes` parameter and instantiates them, using available resources. There is another parameter called `exclusions` in `ScopeProvisioning` class, allowing to reduce transformations availability for framework. `Scope` is alias of ` Module|Package|ClassDeclaration` that provides controll over instantiationing of trnasformations. Other way to provide transformations is to use `ManualProvider`, which requires clients to instantiate transformations manually, but gives precise controll what and how is available for `Gecon`. 

`Gcon` type object, can also be configured. Currently only `Logging` configuration is available to be altered. `Logging` provides ability to change `priority`, which is stadard `ceylon.logging` `priority`. 

### Transformation

What is `Transformation`? A `Transformation` is an interface defined by `herd.gecon.core.engine`, which provides a way for execution of `Transformation.transform` method. It takes source data and transform it into provided result type. Although below interfeces doesn't extends `Transformation` interface (because of transformation method definition). They are wrapped using it and iIn most cases by `Transofmormation` in this guide, one of fallowing interfaces will be ment:

- `Conversion` - Initial entry point for conversion, takes source object and converts it into result type object. Whole flow can be implemented using single `Conversion` or it can delegate to other transformations. Default implementation of this interface is `Converter` which should be used for defining `Conversion`.

- `Resolvance` - Chooses implementation of specific interface, abstract class, or any other type which is ambigous in compile time. The most common use case is selecting collection implementation for interface like `List<String>`. Should this be `LinkedList<String>` , or maybe `ArrayList<String>`? This is handled by implementaton of `Resolvance` interface. Default implementation of this is nterface is `Resolver` which should be used for defining `Resolvance`. 

- `Creation` - Creates specific result type object from provided result type and arguments. `Creation` can be undestood as a constructor / initializer. In cases where conversion is generic and type arguments are not available in compile type it is sometimes usefull to delegate to `Creation`. Default implementation of this interface is `Creator` which should be used for defining `Creation`.

- `Mapping` - Maps result type parts to source parts values using `Dictionary` object. Default implementation of this interface is `Mapper`, which should be used for defining `Mapping`. Example usecase is when converting from json to model object and the naming of fields are different in model than in json. 

`Gecon` type object has a `transform` method which will be used for all transformations.

#### Defining transformation

Most commonly used transformation is `Conversion` implemented by `Converter<Source,Result,ResultType>` class. It has three type parameters as most of transformations:
- Source (Required) - A type of source data provided by framework to the converter,
- Result (Required) - A type of result data which will be produced by converter,
- ResultType (Defaulted :`Type<Result>`) - A Type of result type, provided by the framework to work on, usable only for generic conversions and `Matcher` users. By default in `Conversion.convert` method `resultType` parameter is `Type<Result>`, which is to less for some converters. They may require that `resultType` be `Class<Result>` or `ClassOrInterface<Result>` or `UnionType<Result>` etc. By constraining this type parameter, there is no need for assertations in `Conversion.convert` method body.

Dummy specific converter definition:

```ceylon
shared class StringToNullConverter() extends Converter<String,Null>(){
	shared actual Null convert(Delegator delegator, String source, Type<Null> resultType) => null;
	
}

```

When converter registered by `Provider` it takes `Source` and `Result` types and uses `Hashmap` for storing them. Further when lookup in transformation flow it will be easly retreivable.

Dummy generic converter definition:

```ceylon

shared class AnythingToAnythingConverter() extends Converter<Anything,Anything,Type<Anything>>(){
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		value resolve = delegator.resolve(source, resultType);
		return delegator.convert(source, resolve);
	}
	
	shared actual Matcher matcher => Matcher{
		 predicate(Anything source, Type<Anything> resultType) => (source is String|Null) && (resultType.subtypeOf(`String|Null`));
		 Integer priority = 0;
		
	};
}
```
In this case, registration takes `Matcher` definition. Whenever hashing fail, because for example `Result` type is interface, union type, abstract class, registered `Matcher`s are used for lookup. The search mechanism iterates over available `Matcher`s and if `Matcher.predicate` method returns `true` and the `Matcher.priority` is the biggest in this lookup scope, then this transformation will be used, in this case for conversion. 



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
