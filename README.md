# Gecon
GEneric CONverter of data models for Ceylon 


## Versioning

The versioning of this project starts from 0. Is defined as referenced to version of `herd.gecon.core.api` module as a base, which is defined as CORE-API . Other modules should define it's version, based on this versioning so version of `herd.gecon.core.engine` module will be defined as CORE-API.ENGINE . If a module have it's own API. the versioning for this module will be CORE-API.OTHER-API.MODULE . Change in any API version may mean it is a compatibility break. 

|             Module name             |  Versioning pattern  | Current version |
|:-----------------------------------:|:--------------------:|:---------------:|
| `herd.gecon.core.api`               |       CORE_API       |        0        |
| `herd.gecon.core.engine`            |    CORE_API.ENGINE   |       0.0       |
| `herd.gecon.core.trnasformer`       | CORE_API.TRANSFORMER |       0.0       |
| `herd.gecon.collection.transformer` | CORE_API.TRANSFORMER |       0.0       |
| `herd.gecon.json.transformer`       | CORE_API.TRNASFORMER |      0.0.0      |
| `herd.gecon.test.extension`         |       EXTENSION      |        0        |
