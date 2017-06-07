# ModelWithMJExtension
MJExtension的简单实用与小结。

1.如果是普通的json转model只需一句话mj_objectWithKeyValues即可。    
2.如果model中有数据，数组中又是model，则记得调mj_setupObjectClassInArray指定数组中model的类型。    
3.记得加上mj_setupNewValueFromOldValue，来处理数据有问题的情况。   
4.归解档只需在@implementation中 加入MJExtensionCodingImplementation即可，不过若属性是model的，该model记得也要加MJExtensionCodingImplementation。
