/// @description Clean Up

//Cleaning Up Data Structures
var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len){
	ds_grid_destroy(menu_pages[i]);
	i++;
}
