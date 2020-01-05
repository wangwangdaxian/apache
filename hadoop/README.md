**dependency**: ssh service running and ssh localhost as nopassword


HADOOP native library 没有适合MacOS的预编译版本，忽略相关警告。

MacOS下由于JAVA_HOME会通过/usr/libexe/java_home自动识别最高版本，
并且Hadoop SSH执行命令不经过登陆脚本（.zshrc等），所以要么系统最高装java1.8，
要么直接在hadoop-env.sh中写死JAVA_HOME路径。