#!/bin/awk -f
#运行前
BEGIN {
    printf "-----------------代码行数统计-----------------------\n"
    printf "月份\t\t增加\t\t删除\t\t净增\n"
}
#运行中
{
    if ($1 == "") {
        # printf $1 "是空\n"
    } else if ($1 == "-") {
        # printf $1 "是空\n"
    } else if ($1 ~ /-/) {
        # printf $1 "是日期\n"
        last_month = $1
    } else {
        # printf $1 "不是日期\n"
        # printf "last_month:" last_month "\n"
        add[last_month] += $1
        sul[last_month] += $2
        loc[last_month] += $1 - $2
    }
    # printf "---一行结束------\n"
}
#运行后
END {
    for(i in add)
        print i "\t\t" add[i] "\t\t" sul[i] "\t\t" loc[i]

    printf "----------------------------------------------------\n"
}