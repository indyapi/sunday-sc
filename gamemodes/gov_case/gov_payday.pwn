#include <YSI_Coding\y_hooks>

#define     Gov_MAX     (100)

enum GOVgroup
{
    govMoney
};
new govData[Gov_MAX][GOVgroup];

forward GOVgroup_Load();
public GOVgroup_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

    for (new i = 0; i < rows; i ++) if (i < Gov_MAX)
	{
        cache_get_value_name_int(0, "govMoney", govData[i][govMoney]);
    }
	printf("[SERVER]: %i govgroup were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

GOVgroup_Save(govid)
{
	static
	    query[220];

	//format(query,sizeof(query),"%s govMoney ='%d',",query,playerData[playerid][govMoney]);
    mysql_format(g_SQL, query, sizeof(query), "UPDATE `govgroup` SET `govMoney` = '%d'", govData[govid][govMoney]);
	return mysql_tquery(g_SQL, query);
}
