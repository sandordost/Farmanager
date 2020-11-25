//@desciption create_menu_page
//@arg ["Name1",type1,entries1....]
//@arg ["Name2",type2,entries1....]

//Declaring static vars to adjust menu with ease
grid_width = 5;
// Using a repeat loop to get all the argument given when the script is called upon.
// If script is eing called on without argument the loop wont create anything
//this creates an array to store each row in
var arg, i = 0;
repeat (argument_count){
	arg[i] = argument[i];
	i++;
}
//CREATING a grid so we can store the given arguments into the grid
//The grid gets an ID to be returned
var ds_grid_id = ds_grid_create(grid_width, argument_count);
//This repeat loop put the each row(wich now is an array) into the created grid above
//
//First we get the row
i = 0; 
repeat(argument_count){
	var array = arg[i];
	var array_len = array_length(array);
	//Secondly we go over each collum 
	var xx = 0 ;
	repeat(array_len){
		//and we fill in the cell in the grid
		ds_grid_id[# xx , i] = array[xx];
		xx++;
	}
	i++;
}
//Returning the grid ID to be used later
return ds_grid_id;