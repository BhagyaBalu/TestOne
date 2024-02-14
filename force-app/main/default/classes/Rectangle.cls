//Business Class
public Class Rectangle{
//datamembers
private integer length;
private integer breadth;
private integer width;
private integer area;
//memberMethods
//create
//constructor
public Rectangle(){ 
    //default
    length=0;
    breadth=0;
    width=0;
}
/*//parameterized constructor
public Rectangle(integer l,integer b,integer w)
{
length=1;
breadth=b;
width=w;
} */
//input method
public void setValues(integer l,integer b,integer w)
{
length=l;
breadth=b;
width=w;
} 
//process method
public void Area()
{
area=length*breadth;
system.debug('Area is:' +area);
}
//output method
public void getValues()
{
system.debug(' the area is:' +area);
}
}