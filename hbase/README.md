HBASE lib下有Hadoop依赖包，需要与外部的Hadoop版本兼容。

对于slf4j多binding问题，建议删除`lib/client-facing-thirdparty/slf4j-log4j12-1.7.25.jar`

根据官网第4点描述"Limits on Number of Files and Processes"，需要配置好文件句柄数和进程句柄数。