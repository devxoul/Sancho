//
//  main.c
//  SanchoPrototypePythonEmbedding
//
//  Created by 전 수열 on 12. 7. 30..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#include <stdio.h>
#include <Python/Python.h>

int main(int argc, const char * argv[])
{	
	const char *pluginDir = "/Users/xoul/workspace/Sancho/prototypes/SanchoPrototypePythonEmbedding/plugins";
	
	Py_Initialize();
	
	PyObject *sysPath = PySys_GetObject( "path" );
	PyObject *path = PyString_FromString( pluginDir );
	PyList_Insert( sysPath, 0, path );
	
	PyObject *module = PyImport_ImportModule( "helloworld" );
	if( PyErr_Occurred() )
		PyErr_Print();
	
	PyObject *dict = PyModule_GetDict( module );
	Py_DECREF( module );
	
	PyObject *func = PyDict_GetItemString( dict, "init" );
	
	if( PyCallable_Check( func ) )
	{
		PyObject *arguments = PyTuple_New( 1 );
		PyTuple_SetItem( arguments, 0, PyString_FromString( "Hello" ) );
		
		PyObject *result = PyObject_CallObject( func, arguments );
		Py_DECREF( func );
		Py_DECREF( arguments );
		
		printf( "%s\n", PyString_AsString( result ) );
		Py_DECREF( result );
	}
	else
	{
		printf( "not callable" );
		PyErr_Print();
	}
	
	Py_Finalize();
	
	return 0;
}

